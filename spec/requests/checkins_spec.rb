require 'rails_helper'

RSpec.describe "Checkins", type: :request do
  
  let(:uvalid_attributes) {
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
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      post checkins_url, params: {
        transaction_id:1,
        lat:1,
        lng:1      
      }
      expect(response).to be_successful
    end
  end

end
