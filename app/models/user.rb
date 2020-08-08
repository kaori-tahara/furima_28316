class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :purchases
         has_many :comments
    
     validates :first_name,:family_name,:first_furigana,:family_furigana,:email,:nickname,:birth,:password,presence: true
     

end
