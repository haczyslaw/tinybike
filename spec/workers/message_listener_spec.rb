require 'rails_helper'

describe MessageListener do
  let(:redis_connection) { Redis.new }

  describe ".run" do
    it "starts as daemon" do
      expect(Process).to receive(:daemon).and_return(true)
      expect(MessageListener).to receive(:write_pid).and_return(true)
      expect(MessageListener).to receive(:listen).and_return(true)

      MessageListener.run
    end
  end

  describe ".listen" do
    let(:correct_message) { { 'bike_id' => 'first', 'body' => 'body' }.to_json }
    let(:incorrect_message) { { 'i_am_unicorn' => true }.to_json }

    context "correct message" do
      it "saves record to db" do
        redis_connection.publish('bicycles', correct_message)

        expect {
          MessageListener.listen
        }.to change(Message, :count)
      end
    end

    context "incorrect message" do
      it "raise exception" do
        redis_connection.publish('bicycles', incorrect_message)

        expect {
          MessageListener.listen
        }.to raise_error(ActiveRecord::UnknownAttributeError)
      end
    end
  end

  describe ".write_pid" do
    it "writes correct pid to file" do
      expect_any_instance_of(File).to receive(:puts).with(Process.pid).and_return(true)

      MessageListener.run
    end
  end
end
