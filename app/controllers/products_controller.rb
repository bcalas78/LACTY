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
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @name = @product.name
    if Product.exists?(name: @name)
      @product = Product.find_by(name: @name)
      @product.update(product_params)
    else
      @product = Product.create(product_params)
      if !!(@product.composition =~ (/\w*(fromage|beurre,|margarine|ferments|lactiques)\w*/i))
      @product.category = Category.find_by(name: "orange")
      elsif !!(@product.composition =~ (/\w*(lait |_lait_| lait|cr(e|è|é)me|lactosérum|lact(o|a|u)se|cas(e|è|é)in|babeurre|yaourt)\w*/i))
      @product.category = Category.find_by(name: "red")
      elsif !!(@product.composition =~ (/\w*(sans lait|sans lactose|  )\w*/i))
        @product.category = Category.find_by(name: "green")
      else
        @product.category = Category.find_by(name: "green")
      end
    end
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
    # instancier le produit (id) + instancier la catégorie du produit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
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
