#!/usr/bin/env ruby

require 'active_record'
require 'yaml'
require 'redis'

RAILS_DIR = File.expand_path('../..', __dir__)

database_config = YAML.load_file(File.join(RAILS_DIR, 'config', 'database.yml'))['test']
ActiveRecord::Base.establish_connection(database_config)

require File.join(RAILS_DIR, 'app', 'models', 'message')
require File.join(RAILS_DIR, 'app', 'workers', 'message_listener')

ENV['LISTENER_PID_FILENAME'] =  File.join(RAILS_DIR, 'tmp', 'message_listener_test.pid')

MessageListener.redis_connection(db: 4)

MessageListener.run

