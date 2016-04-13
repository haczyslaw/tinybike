class Message < ActiveRecord::Base
  validates :bike_id, presence: true
  validates :body, presence: true
end
