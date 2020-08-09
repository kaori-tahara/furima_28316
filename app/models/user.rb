class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :purchases
         has_many :comments
    
     validates :birth, presence: true
     validates :nickname,length: { maximum: 40},presence: true

     with_options presence: true, format: { with: /@.+/ } do
     validates :email 
     end
     
     validates :email,uniqueness: true
     
     PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
     validates :password, presence: true,length: { minimum: 6}, format:{ with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'}
     validates :password_confirmation, presence: true,length: { minimum: 6}, format:{ with: PASSWORD_REGEX}

     with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :family_name
    end

    with_options presence: true, format: { with: /\A[ァ-ン一]+\z/, message: '全角(カタカナ)を使用してください' } do
      validates :first_furigana
      validates :family_furigana
    end

 


     
end
