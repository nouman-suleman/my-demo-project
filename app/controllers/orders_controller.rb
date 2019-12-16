class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.user_id = @current_user.id
    @order.save
    if @order.persisted?
      redirect_to @order
    end
  end

  def show
  end
end
