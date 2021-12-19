 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/messages", type: :request do
  
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {from_id: 1, 
    to_id: 2, 
    item_id: 1, 
    content: "", 
    attachments: ""}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      post login_url(), params: { email: "hu_tao@example.com", password: "s3caaar3t",remember_me:"0" }

      get messages_url
      expect(response).to be_successful
    end

    it "renders a successful response" do
        post login_url(), params: { email: "hu_tao@example.com", password: "s3caaar3t",remember_me:"0" }

        get messages_url, params: {item_id: 4}
        expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      # get login_url(), params: {id:1}
      get "/messages/1.json"
      expect(response).to be_successful
    end
  end



  describe "GET /new" do
    it "renders a successful response" do
      post login_url(), params: { email: "hu_tao@example.com", password: "s3caaar3t",remember_me:"0" }
    
      get new_message_url, params: {item_id: 2, to_id: 1}
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Message" do
        post login_url(), params: { email: "hu_tao@example.com", password: "s3caaar3t",remember_me:"0" }
    
        expect {
          post messages_url, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end
    end
  end

 
end
