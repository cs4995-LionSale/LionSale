require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        title: "Title",
        description: "MyText",
        seller: nil,
        price: "9.99",
        status: 2,
        category: nil,
        number: 3
      ),
      Item.create!(
        title: "Title",
        description: "MyText",
        seller: nil,
        price: "9.99",
        status: 2,
        category: nil,
        number: 3
      )
    ])
  end

  # it "renders a list of items" do
  #   render
  #   assert_select "tr>td", text: "Title".to_s, count: 2
  #   assert_select "tr>td", text: "MyText".to_s, count: 2
  #   assert_select "tr>td", text: nil.to_s, count: 2
  #   assert_select "tr>td", text: "9.99".to_s, count: 2
  #   assert_select "tr>td", text: 2.to_s, count: 2
  #   assert_select "tr>td", text: nil.to_s, count: 2
  #   assert_select "tr>td", text: 3.to_s, count: 2
  # end
end
