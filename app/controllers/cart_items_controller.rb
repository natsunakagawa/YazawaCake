class CartItemsController < ApplicationController
  def index
  end

  def create
  	@cart_item = current_end_user.cart_items.new(cart_item_params)
  	@cart_item.save
  	redirect_to cart_items_path
  end

  def update
  	
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
  end
end
