require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      from: nil,
      to: nil,
      item: nil,
      content: "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input[name=?]", "message[from_id]"

      assert_select "input[name=?]", "message[to_id]"

      assert_select "input[name=?]", "message[item_id]"

      assert_select "textarea[name=?]", "message[content]"
    end
  end
end
