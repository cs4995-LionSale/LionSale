class Category < ApplicationRecord
  belongs_to :parent_category_id
end
