require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      item_id: nil,
      seller_id: nil,
      buyer_id: nil,
      deal_address: "MyString",
      deal_price: "9.99",
      status: 1,
      seller_rating: 1,
      buyer_rating: 1
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[item_id_id]"

      assert_select "input[name=?]", "transaction[seller_id_id]"

      assert_select "input[name=?]", "transaction[buyer_id_id]"

      assert_select "input[name=?]", "transaction[deal_address]"

      assert_select "input[name=?]", "transaction[deal_price]"

      assert_select "input[name=?]", "transaction[status]"

      assert_select "input[name=?]", "transaction[seller_rating]"

      assert_select "input[name=?]", "transaction[buyer_rating]"
    end
  end
end
