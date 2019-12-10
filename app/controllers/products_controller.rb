class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]

  def index
    if current_user.nil?
      @products = Product.all
    else
      @others_products = Product.where.not(user_id: current_user.id)
      @my_products = current_user.products
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.persisted?
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end


  private
    def product_params
      params.require(:product).permit(:name, :category, :price, :user_id)
    end
end
