class TransactionsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @product_buyer = ShippingAddress.new(purchase_params)
    if @product_buyer.valid?
      pay_item
      @product_buyer.save
    redirect_to root_path, notice: 'ご購入を受け付けました。'
    else
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:token,:zip,:city,:address,:building_name,:phone_number,:prefecture_id,:item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = sk_test_896aa3803241d953942ecf6a  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  




end

