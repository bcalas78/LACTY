class CategoriesController < ApplicationController
  def find_by_color(color)
    @categories = Categories.all
    @categories.where(color: color).id
  end
end
