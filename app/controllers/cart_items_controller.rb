class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price = @total_price + ((cart_item.item.price*1.1).round)*cart_item.amount 
    end
  end

  def create
    @cart_item = current_end_user.cart_items.new(cart_item_params)
    if presence = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]) 
      amount = @cart_item.amount + presence.amount
      presence.update(amount: amount)
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
  	@cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_cart
    @end_user = current_end_user
    EndUser.find(@end_user.id).cart_items.destroy_all
    redirect_to items_path
  end

  private
  def cart_item_params
  	params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
  end
end
