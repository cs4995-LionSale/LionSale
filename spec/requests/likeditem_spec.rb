require 'rails_helper'

RSpec.describe "Likeditems", type: :request do
  # let(:valid_attributes) {
  #   # skip("Add a hash of attributes valid for your model")
  #   {
  #     item_id:1,   
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
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      post "/likeditems", params: {
        item_id:1,   
      }
      expect(response).to have_http_status(:redirect)
    end

    it "returns error" do
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      post "/likeditems", params: {
        item_id:100,   
      }
      expect(response).to have_http_status(:redirect)
    end

    it "returns Fail to like this item. " do
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      post "/likeditems", params: {
        item_id:1,   
      }
      post "/likeditems", params: {
        item_id:1,   
      }
      expect(response).to have_http_status(:redirect)
    end

  end

  describe "DELETE /destroy" do
    it "returns http success" do
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      # post items_url, params: { item: {title: "book",
      #   description: "CS book",
      #   seller_id: 6,
      #   price: 11,
      #   category_id: 1} }

      post "/likeditems", params: {
        item_id:1,   
      }
      # post "/likeditems", params: {
      #   item_id:2,   
      # }
      delete "/likeditems/1", params: {item_id: 1}
      expect(response).to have_http_status(:redirect)
    end

    it "returns http success" do
      user = User.create! uvalid_attributes
      post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }

      # post "/likeditems", params: {
      #   item_id:1,   
      # }
      # post "/likeditems", params: {
      #   item_id:2,   
      # }
      delete "/likeditems/1", params: {item_id: 1}
      expect(response).to have_http_status(:redirect)
    end

  end

end
