require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      sender_id: nil,
      to_id: nil,
      item_id: nil,
      content: "MyText"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input[name=?]", "message[sender_id_id]"

      assert_select "input[name=?]", "message[to_id_id]"

      assert_select "input[name=?]", "message[item_id_id]"

      assert_select "textarea[name=?]", "message[content]"
    end
  end
end
