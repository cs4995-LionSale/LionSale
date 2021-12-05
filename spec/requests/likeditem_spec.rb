require 'rails_helper'

RSpec.describe "Likeditems", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/likeditem/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/likeditem/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
