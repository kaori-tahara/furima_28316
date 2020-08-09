class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options belongs_to_active_hash do
    :category
    :item_statue
    :shipping_charge
    :prefecture
    :period_until_shipping
 end

  # 空の投稿を保存できないようにする
  validates :name, :text, :picture, :price, :category, :item_statue, :shipping_charge, :prefecture, :period_until_shipping, presence: true
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :item_statue_id, :shipping_charge_id, :prefecture_id, :period_until_shipping_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one    :purchase
  has_one    :shipping_address
  has_many   :comments
  has_one_attached :picture
end


