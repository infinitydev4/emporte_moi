class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :téléphone, :presence => {:message => 'champ obligatoire'},
                        :numericality => {:message => 'doit être un nombre'},
                        :length => { :minimum => 10, :maximum => 10 }
end