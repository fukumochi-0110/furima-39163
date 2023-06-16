class ItemsController < ApplicationController
  before_action :basic_auth

  def index
    
  end

  def new
    @item = Item.new

    if user_signed_in?
      render :new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end
