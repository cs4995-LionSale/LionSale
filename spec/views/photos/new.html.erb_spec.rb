require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      photo_url: "MyString",
      item: nil
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input[name=?]", "photo[photo_url]"

      assert_select "input[name=?]", "photo[item_id]"
    end
  end
end
