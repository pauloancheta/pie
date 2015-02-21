class User < ActiveRecord::Base
  has_secure_password

  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites

  has_many :inverse_favourites, class_name: 'Favourites', foreign_key: 'favourited_user_id'
  has_many :inverse_favourited_users, through: :inverse_favourites, source: :user

  has_many :menus

  has_one :preference
  has_one :recipe, through: :preference
  
  validates :name, :address, :phone_number, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
