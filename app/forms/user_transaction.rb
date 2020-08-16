class UserTransaction

  include ActiveModel::Model
  attr_accessor :zip,:city,:address,:building_name,:phone_number,:prefecture_id,:user_id,:item_id



  # shippingaddressのバリデーション
  with_options presence: true do
    validates :zip ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address 
    validates :phone_number,format: {with: /\A[0-9]{11}\z/, message: "ハイフン抜きの半角数字で入力してください"}
  end

  with_options presence: true, numericality: { greater_than: 1,message: "can't be blank" } do
    validates :prefecture_id
  end


  # purchase,shippinaddressを一緒に保存するので
   def save
    ShippingAddress.create(zip: zip, city: city, address: address, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, user_id: user_id, item_id: item_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end




end