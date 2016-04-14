namespace :bike do
  desc "Send message from bike"
  task msg: :environment do
    MessageSender.send(ENV['BIKE_ID'])
  end
end
