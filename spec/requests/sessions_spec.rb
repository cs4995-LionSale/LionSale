require 'rails_helper'

RSpec.describe "Sessions", type: :request do
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

  describe "GET /new" do
    it "returns http success" do
    #   get "/sessions/new"
      get login_url()
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new session" do
        user = User.create! valid_attributes
        expect {
          post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
        }.to change(User, :count).by(0)
      end

      it "redirects to the created session" do
        user = User.create! valid_attributes
        post login_url(), params: { email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "with invalid parameters" do
      it "does not create a new session" do
        user = User.create! valid_attributes
        expect {
          post login_url(), params: { email: "email@columbia.edu", password: "Passwordest",remember_me:"0" }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        user = User.create! valid_attributes
        post login_url(), params: { email: "email@columbia.edu", password: "Passwordest",remember_me:"0" }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the session" do
      session = Session.create! {email: "email@columbia.edu", password: "Password Digest",remember_me:"0" }
      delete session_url(session)
      expect(response).to redirect_to(root_url())
    end

    # it "redirects to the users list" do
    #   user = User.create! valid_attributes
    #   delete user_url(user)
      # expect(response).to redirect_to(signup_url)
    # end
  end

end
