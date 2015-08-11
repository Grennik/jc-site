class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, # :omniauthable # :registerable,  :lockable,
  devise :database_authenticatable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable

 has_many :pages
end
