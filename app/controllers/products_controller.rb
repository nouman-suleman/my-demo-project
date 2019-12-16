class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]

  def index
      @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.order(" created_at DESC")
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
      params.require(:product).permit(:name, :description, :price, :user_id, images: [])
    end
end
