require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "change_stock" do
    it "check change_stock" do
      item = Item.find_by_id(2)
      item.change_stock(0,0)
    end

    it "check change_stock" do
      item = Item.find_by_id(2)
      item.change_stock(1,1)
    end
  end

  describe "is_liked" do
    it "check is_liked" do
      user = User.find_by_id(1)
      item = Item.find_by_id(1)
      item.is_liked?(user)
    end
  end

end
