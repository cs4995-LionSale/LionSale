require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "Email",
        username: "Username",
        password_digest: "Password Digest",
        address: "Address",
        rating_seller: 2.5,
        rating_buyer: 3.5,
        permission: 4
      ),
      User.create!(
        email: "Email",
        username: "Username",
        password_digest: "Password Digest",
        address: "Address",
        rating_seller: 2.5,
        rating_buyer: 3.5,
        permission: 4
      )
    ])
  end

  # it "renders a list of users" do
  #   render
  #   assert_select "tr>td", text: "Email".to_s, count: 2
  #   assert_select "tr>td", text: "Username".to_s, count: 2
  #   assert_select "tr>td", text: "Password Digest".to_s, count: 2
  #   assert_select "tr>td", text: "Address".to_s, count: 2
  #   assert_select "tr>td", text: 2.5.to_s, count: 2
  #   assert_select "tr>td", text: 3.5.to_s, count: 2
  #   assert_select "tr>td", text: 4.to_s, count: 2
  # end
end
