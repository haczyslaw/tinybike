require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :bike_id => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_bike_id[name=?]", "message[bike_id]"

      assert_select "textarea#message_body[name=?]", "message[body]"
    end
  end
end
