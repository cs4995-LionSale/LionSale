require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
    before(:each) do
      assign(:item, Item.new(
        title: "MyString",
        description: "MyText",
        seller: nil,
        price: "9.99",
        status: 1,
        category: nil,
        number: 1
      ))
    end
  
  
  end
