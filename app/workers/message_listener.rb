module MessageListener
  module_function

  def listen
    begin
      redis_connection.subscribe('bicycles') do |on|
        on.message do |channel, message|
          attributes = JSON.parse(message)
          Message.create!(attributes)
        end
      end
    rescue Redis::BaseConnectionError => error
      puts "#{error}, retrying in 1s"
      sleep 1
      retry
    end
  end

  def redis_connection(options = {})
    @redis_connection ||= Redis.new(options)
  end

  def write_pid
    file = File.new(pid_file_name, 'w')
    file.puts Process.pid
    file.close
  end

  def pid_file_name
    ENV['LISTENER_PID_FILENAME'] ||
      File.expand_path('../../tmp/message_listener.pid', __dir__)
  end

  def run
    Process.daemon
    write_pid
    listen
  end
end

