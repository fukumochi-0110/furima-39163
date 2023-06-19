class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :same_action, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
    else
      redirect_to root_path
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :burden_id, :prefecture_id, :duration_id,
                                 :price, :user, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in? && current_user.id == @item.user.id

    redirect_to root_path
  end

  def same_action
    @item = Item.find(params[:id])
  end
end
