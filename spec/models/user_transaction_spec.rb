require 'rails_helper'
RSpec.describe UserTransaction, type: :model do
  describe '#create' do
    before do
      @seller = FactoryBot.build(:user)
      @buyer = FactoryBot.build(:user)
      @item = FactoryBot.build(:item, user_id: @seller.id)
      @item.picture = fixture_file_upload('public/test.mages.jpeg')
      @item.save
      @buy = FactoryBot.build(:user_transaction, user_id: @buyer.id)
    end

    context 'itemの購入ができる場合' do
      it 'クレジットカード情報、有効期限、セキュリティコード、郵便番号、都道府県、市区町村、番地、電話番号があれば購入できる' do
        expect(@buy).to be_valid
      end
    end
  

    context 'itemの購入ができない場合（保存できない場合）' do
      it '郵便番号がないと保存できない' do
        @buy.zip = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Zip can't be blank")
      end

      it '郵便番号がハイフンを含んでいないと保存できない' do
        @buy.zip = "8191214"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Zip (郵便番号)はハイフンを含めて記載してください")
      end

      it '都道府県がないと保存できない' do
        @buy.prefecture_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村の記載がないと保存できない' do
        @buy.city = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end


      it '番地がないと保存できない' do
        @buy.address = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと保存できない' do
        @buy.phone_number = ""
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁でないと保存できない' do
        @buy.phone_number = "1234567891111"
        @buy.valid? 
        expect(@buy.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end      
      

      it 'takenが空だと保存できない' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end

      

    end
  end
end

