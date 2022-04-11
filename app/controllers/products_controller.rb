class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @product = Product.new
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR composition ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    else
      # @products = Product.all
      render :index
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end

  def create
    @product = Product.new(product_params)
    if !!(@product.composition =~ /(lait|fromage|  beurre  |margarine|ferments lactiques)/)
      @product.category = Category.find_by(name: "orange")
    elsif !!(@product.composition =~ /(lait|cr(e|è|é)me|lact(u|a|o)|cas(e|è|é)in|babeurre|yaourt)/)
      @product.category = Category.find_by(name: "red")
    elsif !!(@product.composition =~ /(sans lait|sans lactose|  )/)
      @product.category = Category.find_by(name: "green")
    end

    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
    # instancier le produit (id) + instancier la catégorie du produit
  end

  def search
    # @products = Product.all
    # @product.where(:name )
  end

  private

  def product_params
    params.require(:product).permit(:name, :composition, :image)
  end
end
#    compositions = @product.composition.split
#    compositions.each do |composition|
#      # /^lait$/i
#  if composition.match(/^(lait|fromage|beurre|margarine|ferments lactiques)$/i)
#    @product.category_id = Category.find_by_color("orange")
#  elsif composition.match(/\w*(lait|cr(e|è|é)me|lact(u|a|o)|cas(e|è|é)in)|babeurre|yaourt\w*/i)
#    @product.category_id = Category.find_by(name: "red")
#  elsif composition.match(/\w*(sans lait|sans lactose|  )\w*/i)
#    @product.category_id = Category.find_by(name: "green")
#  else
#    @product.category_id = Category.find_by(name: "green")
#  end
#    end
