class Category < ApplicationRecord
  has_many :subcatgories, class_name: "Category",
                          foreign_key: "parent_category_id"
  has_many :items, class_name: "Item", inverse_of: 'category'
  belongs_to :parent_category, class_name: "Category", optional: true
end
