class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :presentation ]

  def home
  end

  def presentation
  end
end
