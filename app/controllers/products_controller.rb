class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def scanner
    @product = Product.new
    render :scanner
  end

  def index

    # if params[:query].present?
    #   sql_query = "name ILIKE :query OR composition ILIKE :query"
    #   @products = Product.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @products = Product.all
    # end

  end

  def show
    # instancier le produit (id) + instancier la catégorie du produit
  end

  def search
    # @products = Product.all
    # @product.where(:name )
  end

  def create
  #   @product = Product.new(product_params)
  #   #orange
  #   compositions = @product.composition.split(",")
  #   compositions.each do |composition|
  #   if composition.match(/\w*(lait|cr(e|è|é)me|lact(u|a|o)|cas(e|è|é)in)|babeurre|yaourt\w*/i)
  #     @product.category = Category.find_by(name: "orange")
  #     elsif composition.match(/\w*(lait|cr(e|è|é)me|lact(u|a|o)|cas(e|è|é)in)|babeurre|yaourt\w*/i)
  #     @product.category = Category.find_by(name: "red")
  #     #vert
  #     else

  #   end
  #   end


  #   if @product.save!
  #     redirect_to product_path(@product)
  #   else
  #   #  render :show
  #   end
  end

  private

  def product_params
    params.require(:product).permit(:name, :composition)
  end
end
