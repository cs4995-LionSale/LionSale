require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        photo_url: "Photo Url",
        item_id: nil
      ),
      Photo.create!(
        photo_url: "Photo Url",
        item_id: nil
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", text: "Photo Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
