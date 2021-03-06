class Category < ApplicationRecord
  has_many :subcatgories, class_name: "Category",
                          foreign_key: "parent_category_id"
  has_many :items, class_name: "Item", inverse_of: 'category', foreign_key: 'category_id'
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "parent_category_id"

  def get_category_path
    r = [self]
    curr = parent_category
    while curr do
      r = r.push(curr)
      curr = curr.parent_category
    end
    return r.reverse()
  end

  def get_sub_categories(r)
    r = r.push(self)
    if subcatgories
      subcatgories.each do |subcat|
        r = r + subcat.get_sub_categories(r)
      end
    end
    return r
  end
end
