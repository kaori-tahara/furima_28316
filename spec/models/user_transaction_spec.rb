require 'rails_helper'
RSpec.describe UserTransaction, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'itemの購入ができる場合' do
      it '画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば保存でき出品できる' do
        expect(@item).to be_valid
      end
    end

    context 'itemの出品ができない場合（保存できない場合）' do
      it 'pictureがないと保存できない' do
        @item.picture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Picture can't be blank")
      end

      it 'nameがないと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end