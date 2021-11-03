require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        item: nil,
        seller: nil,
        buyer: nil,
        deal_address: "Deal Address",
        deal_price: "9.99",
        status: 2,
        seller_rating: 3,
        buyer_rating: 4
      ),
      Transaction.create!(
        item: nil,
        seller: nil,
        buyer: nil,
        deal_address: "Deal Address",
        deal_price: "9.99",
        status: 2,
        seller_rating: 3,
        buyer_rating: 4
      )
    ])
  end

  # it "renders a list of transactions" do
  #   render
  #   assert_select "tr>td", text: nil.to_s, count: 2
  #   assert_select "tr>td", text: nil.to_s, count: 2
  #   assert_select "tr>td", text: nil.to_s, count: 2
  #   assert_select "tr>td", text: "Deal Address".to_s, count: 2
  #   assert_select "tr>td", text: "9.99".to_s, count: 2
  #   assert_select "tr>td", text: 2.to_s, count: 2
  #   assert_select "tr>td", text: 3.to_s, count: 2
  #   assert_select "tr>td", text: 4.to_s, count: 2
  # end
end
