require 'spec_helper'
require 'active_record'
require 'yaml'
require 'redis'

RAILS_DIR = File.expand_path('../..', __dir__)

# Database
database_config = YAML.load_file(File.join(RAILS_DIR, 'config', 'database.yml'))['test']
ActiveRecord::Base.establish_connection(database_config)

require File.join(RAILS_DIR, 'app', 'models', 'message')
require File.join(RAILS_DIR, 'app', 'lib', 'message_sender')

MessageSender.establish_redis_connection(db: 4)

describe 'Full Message Listener Spec' do
  before(:all) { start_worker }
  after(:all) { kill_worker }

  before do
    MessageSender.redis_connection.flushdb
    Message.delete_all
  end

  it 'creates two message' do
    MessageSender.send 'test1'
    MessageSender.send 'test2'

    sleep 0.5 # wait for worker

    expect(Message.count).to eq 2
    expect(Message.where(bike_id: 'test1').count).to eq 1
    expect(Message.where(bike_id: 'test2').count).to eq 1
  end

  def start_worker
    `#{RAILS_DIR}/spec/fulltest/message_listener_luncher.rb`
  end

  def kill_worker
    file_name = File.join(RAILS_DIR, 'tmp', 'message_listener_test.pid')
    Process.kill("SIGTERM", File.read(file_name).to_i)
  end
end

