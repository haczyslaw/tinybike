require 'rails_helper'

RSpec.describe "messages/index", type: :view do

  it "renders empty table" do
    render
    assert_select "tr>th", :text => "Id".to_s, :count => 1
    assert_select "tr>th", :text => "Bike Id".to_s, :count => 1
    assert_select "tr>th", :text => "Body".to_s, :count => 1
  end
end
