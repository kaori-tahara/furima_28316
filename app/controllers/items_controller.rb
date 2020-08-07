class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
    # redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.new
    @items = @tweet.items.includes(:user)
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(item_params[:id])
    item.update(item_params[:id])
    if item.save
      redirect_to root_path
    else
      render :update
    end
  end

  private

  def item_params
    params.require(:item).permit( :name, :text,:price, :picture, :category_id, :item_statue_id, :shipping_charge_id, :prefecture_id, :period_until_shipping_id).merge(user_id: 1)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
