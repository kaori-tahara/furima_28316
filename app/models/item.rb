class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one    :shipping_address
  has_many   :comments
  has_one_attached :picture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_statue
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :period_until_shipping

  with_options presence: true do
    validates :name
    validates :text
    validates :picture
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end

  with_options presence: true, numericality: { greater_than: 1 } do
    validates :category_id
    validates :item_statue_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :period_until_shipping_id
  end


end
