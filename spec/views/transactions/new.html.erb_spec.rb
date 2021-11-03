require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      item: nil,
      seller: nil,
      buyer: nil,
      deal_address: "MyString",
      deal_price: "9.99",
      status: 1,
      seller_rating: 1,
      buyer_rating: 1
    ))
  end

  # it "renders new transaction form" do
  #   render

  #   assert_select "form[action=?][method=?]", transactions_path, "post" do

  #     assert_select "input[name=?]", "transaction[item_id]"

  #     assert_select "input[name=?]", "transaction[seller_id]"

  #     assert_select "input[name=?]", "transaction[buyer_id]"

  #     assert_select "input[name=?]", "transaction[deal_address]"

  #     assert_select "input[name=?]", "transaction[deal_price]"

  #     assert_select "input[name=?]", "transaction[status]"

  #     assert_select "input[name=?]", "transaction[seller_rating]"

  #     assert_select "input[name=?]", "transaction[buyer_rating]"
  #   end
  # end
end
