require 'rails_helper'

describe MessageSender do
  describe '.send' do
    let(:redis_connection) { Redis.new }

    it 'sent valid message' do
      MessageSender.send('test')

      msg = read_msg
      expect(msg['bike_id']).to eq 'test'
      expect(msg['body'].length).to eq 500
    end
  end

  describe '.generate_body' do
    subject { MessageSender.generate_body }

    it 'has 500 chars' do
      expect(subject.length).to eq 500
      expect(subject.class).to eq String
    end
  end


  def read_msg
    redis_connection.subscribe('bicycles') do |on|
      on.message do |channel, message|
        return JSON.parse(message)
      end
    end
  end
end
