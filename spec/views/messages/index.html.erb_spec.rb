require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        sender_id: nil,
        to_id: nil,
        item_id: nil,
        content: "MyText"
      ),
      Message.create!(
        sender_id: nil,
        to_id: nil,
        item_id: nil,
        content: "MyText"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
