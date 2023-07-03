class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, locals: {order_address: @order_address}
    end

  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture, :municipality, :street_address, :building_name, :phone_number, :prefecture_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
  
  def pay_item
    binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
