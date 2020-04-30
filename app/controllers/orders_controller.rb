class OrdersController < ApplicationController
  
  before_action :confirm_cart_item, only: [:new, :confirm, :create]

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
    if order_params[:payment_method] == nil || order_params[:select_address] == nil
      redirect_to new_order_path
    end

    session[:payment_method] = order_params[:payment_method]
    @select_address = order_params[:select_address]
    
    if order_params[:select_address] == "3"
      session[:ship_postal_code] = order_params[:ship_postal_code]
      session[:ship_address] = order_params[:ship_address]
      session[:ship_name] = order_params[:ship_name]
    
    elsif order_params[:select_address] == "2"
      @address = Addresse.find_by(id: order_params[:address_info])
    end

    @order = Order.new
    @cart_items = CartItem.all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price = @total_price + ((cart_item.item.price*1.1).round)*cart_item.amount
    end


  end

  def create
    @order = Order.new
    if order_params[:select_address] == "1"
      @order.ship_name = current_end_user.last_name + current_end_user.first_name
      @order.ship_address = current_end_user.address
      @order.ship_postal_code = current_end_user.postal_code
    
    elsif order_params[:select_address] == "2"
      @address = Addresse.find_by(id: order_params[:address_info])
      @order.ship_name = @address.name
      @order.ship_address = @address.address
      @order.ship_postal_code = @address.postal_code

    else
      @order.ship_name = order_params[:ship_name]
      @order.ship_address = order_params[:ship_address]
      @order.ship_postal_code = order_params[:ship_postal_code]
    
    end
    
    @order.end_user_id = current_end_user.id
    @order.payment = order_params[:payment]
    @order.postage = 800
    @order.payment_method = (order_params[:payment_method]).to_i
    @order.save

    current_end_user.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item.id
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
      order_detail.buy_price = cart_item.item.price
      order_detail.save
    end
    CartItem.destroy_all

    redirect_to complete_order_path

  end

  def complete
    
  end

  def confirm_cart_item
  	@cart_items = CartItem.all
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price = @total_price + ((cart_item.item.price*1.1).round)*cart_item.amount
    end

    if @total_price == 0
    	redirect_to items_path
    end
  end


  private

  def order_params
    params.require(:order).permit(:payment, :payment_method, :ship_name, :ship_address, 
                                    :ship_postal_code, :select_address, :address_info)
  end
end