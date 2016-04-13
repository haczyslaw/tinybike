require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { Message.new(bike_id: 'Bike Id', body: 'Body') }

  describe "validations" do
    it { is_expected.to validate_presence_of(:bike_id) }
    it { is_expected.to validate_presence_of(:body) }
  end

  describe "associations" do
    it { is_expected.to have_db_index(:bike_id) }
  end
end
