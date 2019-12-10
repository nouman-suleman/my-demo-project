class CartController < ApplicationController

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create

  end


  def update

  end

  def destroy

  end

  private

    def find_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
