class TransactionsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @user_transaction = UserTransaction.new(purchase_params)
    if @user_transaction.valid?
      pay_item
      @user_transaction.save
    #  @buyer = Purchase.find(params[:purchase_id])
    redirect_to items_path
    else
    redirect_to item_transactions_path
    end
  end


  private

  def purchase_params
    params.permit(:zip,:city,:address,:building_name,:phone_number,:prefecture_id,:item_id).merge(user_id: current_user.id)
  end
   

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = 'sk_test_896aa3803241d953942ecf6a'# PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    ) 
  end


end

