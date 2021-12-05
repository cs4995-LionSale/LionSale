require 'rails_helper'

RSpec.describe "Checkins", type: :request do
  # let(:valid_attributes) {
  #   # skip("Add a hash of attributes valid for your model")
  #   {
  #     transaction_id:1,
  #     lat:1,
  #     lng:1      
  #   }
  # }
  let(:uvalid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    {
      email: "email@columbia.edu",
      username: "Username",
      password: "Password Digest",
      password_confirmation: "Password Digest",
      address: "Address",
      rating_seller: 2.5,
      rating_buyer: 3.5,
      permission: 4
    }
  }

  describe "POST /create" do
    it "returns http success" do
      # post "/checkins", params: { transaction_id: 1 }
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      
      # post login_url(), params: { email: User.find(1).email, password: User.find(1).password,remember_me:"0" }
      # puts(Transaction.find_by_id(1).deal_address)
      post checkins_url, params: {
        transaction_id:1,
        lat:1,
        lng:1      
      }
      # puts(response.body)
      expect(response).to be_successful
    end
  end

end
