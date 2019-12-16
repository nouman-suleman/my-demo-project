class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_cart


  private
    def set_cart
      if current_user
        cart = Cart.find_by(:user_id => current_user.id)
        if cart.present?
          @current_cart = cart
        else
          current_user.cart = Cart.new
          @current_cart = current_user.cart
        end
      end
    end



end
