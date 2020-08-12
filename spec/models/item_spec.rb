require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
   before do
    @item = FactoryBot.build(:item)
    @item.picture = fixture_file_upload('public/test.mages.jpeg')
   end

     context "itemの出品ができる場合" do
       it "画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば保存でき出品できる" do
        expect(@item).to be_valid
       end
      end
  

     context "itemの出品ができない場合（保存できない場合）" do
       it "pictureがないと保存できない" do
        @item.picture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Picture can't be blank")
       end

       it "nameがないと保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
       end

       it "textがないと保存できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
       end

       it "priceがないと保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
       end

       it "priceが300以下の時は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
       end

       it "priceが9999999以上の時は保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
       end
       
       it "categoryがないと保存できない" do
        @item.category_id = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
       end

       it "item_statueがないと保存できない" do
        @item.item_statue_id = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Item statue can't be blank")
       end

       it "shipping_chargeがないと保存できない" do
        @item.shipping_charge_id = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
       end

       it "prefectureがないと保存できない" do
        @item.prefecture_id = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
       end

       it "period_until_shippingがないと保存できない" do
        @item.period_until_shipping_id = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Period until shipping can't be blank")
       end

       it "ユーザーが紐付いていないとitemは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
       end

      end
    
  end
end