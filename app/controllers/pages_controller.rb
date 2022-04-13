class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def favorite
    @favorite_products = current_user.favorited_by_type('Product')
  end
end
