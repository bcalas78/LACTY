class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @reviews = Review.all
  end

  def new
    @reviews = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    if @review.save
      redirect_to product_path(@product, anchor: "review-#{@review.id}")
    else
      render 'products/show'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    # redirect_to review_path
  end

  # def destroy
  #   @review.destroy
  #   # redirect_to root_path
  # end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end

end
