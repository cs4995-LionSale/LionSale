class CategoriesController < ApplicationController

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

end
