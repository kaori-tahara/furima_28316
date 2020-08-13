class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit]

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

  def update
    @item = Item.find(params[:id])
    @item.update(params[:id])
    if @item.save
      redirect_to root_path
    else
      render :update
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :picture, :category_id, :item_statue_id, :shipping_charge_id, :prefecture_id, :period_until_shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end



end
