require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      title: "MyString",
      description: "MyText",
      seller: nil,
      price: "9.99",
      status: 1,
      category: nil,
      number: 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[seller_id]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[status]"

      assert_select "input[name=?]", "item[category_id]"

      assert_select "input[name=?]", "item[number]"
    end
  end
end
