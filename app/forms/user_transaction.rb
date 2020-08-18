class UserTransaction

  include ActiveModel::Model
  attr_accessor :zip,:city,:address,:building_name,:phone_number,:prefecture_id,:user_id,:item_id,:token



  # shippingaddressのバリデーション
  with_options presence: true do
    validates :zip ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "(郵便番号)はハイフンを含めて記載してください"}
    validates :city
    validates :address 
    validates :phone_number,length: { maximum: 11 }
    validates :token
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