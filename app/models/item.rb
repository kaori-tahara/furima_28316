class Item < ApplicationRecord
  varidates  :text,presence: true
  belongs_to :user
  has_one    :purchase
  has_one    :shipping_address
  has_many   :comments
end
