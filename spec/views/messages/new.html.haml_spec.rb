require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :bike_id => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_bike_id[name=?]", "message[bike_id]"

      assert_select "textarea#message_body[name=?]", "message[body]"
    end
  end
end
