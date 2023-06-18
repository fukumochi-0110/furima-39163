class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id, :price, :user, :image).merge(user_id: current_user.id)
  end
end
