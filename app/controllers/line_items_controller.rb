class LineItemsController < ApplicationController

  def create

    selected_product = Product.find(params[:product_id])

    if @current_cart.products.include?(selected_product)
      @line_item = @current_cart.line_items.find_by(:product_id => selected_product)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = @current_cart
      @line_item.product = selected_product
      @line_item.unit_price = selected_product.price
      @line_item.quantity = 1
      @line_item.order_id = nil
    end

    @line_item.save!
    redirect_to root_path
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def line_item_params
      params.require(:line_item).permit(:quantity,:product_id, :cart_id)
    end

end
