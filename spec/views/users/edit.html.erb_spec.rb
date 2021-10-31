require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      email: "MyString",
      username: "MyString",
      password_digest: "MyString",
      address: "MyString",
      rating_seller: 1.5,
      rating_buyer: 1.5,
      permission: 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password_digest]"

      assert_select "input[name=?]", "user[address]"

      assert_select "input[name=?]", "user[rating_seller]"

      assert_select "input[name=?]", "user[rating_buyer]"

      assert_select "input[name=?]", "user[permission]"
    end
  end
end
