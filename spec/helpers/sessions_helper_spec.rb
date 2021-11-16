require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  let(:valid_attributes) {
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
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe "log_in(user)" do
    it "check user.permission" do
      user = User.create! valid_attributes
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "current_user" do
    it "check user_id = session[:user_id]" do
      user = User.create! valid_attributes
      log_in(user)
      current_user()
      expect(session[:user_id]).to eq(user.id)
    end
    it "check user_id = cookies.signed[:user_id]" do
      user = User.create! valid_attributes
      # log_in(user)
      remember(user)
      # log_out()
      current_user()
      expect(@current_user).to eq(user)
    end
  end

  describe "logged_in?(user)" do
    it "check logged_in?" do
      expect(logged_in?()).to eq(false)
    end
  end

  describe "remember(user)" do
    it "check remember" do
      user = User.create! valid_attributes
      remember(user)
      expect(cookies.permanent.signed[:user_id]).to eq(user.id)
    end
  end

  describe "log_out" do
    it "check log_out" do
      user = User.create! valid_attributes
      log_in(user)
      log_out()
      expect(session[:user_id]).to eq(nil)
    end
  end

  describe "current_user?(user)" do
    it "check current_user?(user)" do
      user = User.create! valid_attributes
      log_in(user)
      current_user?(user)
      expect(session[:user_id]).to eq(user.id)
    end    
  end

  describe "logged_in?" do
    it "check logged_in?" do
      user = User.create! valid_attributes
      log_in(user)
      current_user()
      expect(logged_in?()).to eq(true)
    end    
  end
  

  


end
