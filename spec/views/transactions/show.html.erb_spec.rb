require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      item: nil,
      seller: nil,
      buyer: nil,
      deal_address: "Deal Address",
      deal_price: "9.99",
      status: 2,
      seller_rating: 3,
      buyer_rating: 4
    ))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(//)
  #   expect(rendered).to match(//)
  #   expect(rendered).to match(//)
  #   expect(rendered).to match(/Deal Address/)
  #   expect(rendered).to match(/9.99/)
  #   expect(rendered).to match(/2/)
  #   expect(rendered).to match(/3/)
  #   expect(rendered).to match(/4/)
  # end
end
