require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_attributes) {
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

  describe "items_sold_num" do
    it "check items_sold_num" do
      user = User.create! valid_attributes
      user.items_sold_num()
    end
  end

  describe "authenticated?" do
    it "check authenticated?" do
      user = User.create! valid_attributes
      expect(user.authenticated?(user.remember_token)).to eq(false)
    end
  end


end
