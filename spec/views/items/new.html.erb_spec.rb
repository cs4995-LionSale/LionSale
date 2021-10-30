require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      title: "MyString",
      description: "MyText",
      seller_id: nil,
      price: "9.99",
      status: 1,
      category_id: nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[seller_id_id]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[status]"

      assert_select "input[name=?]", "item[category_id_id]"
    end
  end
end
