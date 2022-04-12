class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @reviews = Review.all
  end

  def new
    # @product = Product.find(params[:product_id])
    @reviews = Review.new
  end

  def create
    @user = current_user
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.product = @product

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "products/show" }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def edit
    # set_review if user_signed_in? && current_user_id == @user_id
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
