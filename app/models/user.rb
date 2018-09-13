class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :téléphone, :presence => {:message => 'champ obligatoire'},
                        :numericality => {:message => 'doit être un nombre'},
                        :length => { :minimum => 10, :maximum => 10 }
  has_many :plats
  has_one :panier
  has_many :orders
  has_many :comments
  has_one_attached :image_profile
end
