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

  def redis_connection
    @redis_connection ||= Redis.new
  end

  def write_pid
    file = File.new(Rails.root.join('tmp','message_listener.pid'), 'w')
    file.puts Process.pid
    file.close
  end

  def run
    Process.daemon
    write_pid
    listen
  end
end

