namespace :worker do
  desc "Start Message Listener Worker"
  task start: :environment do
    MessageListener.run
  end

  desc "Stop Message Listener Worker"
  task stop: :environment do
    file_name = File.join(Rails.root, 'tmp', 'message_listener.pid')
    Process.kill("SIGTERM", File.read(file_name).to_i)
  end
end
