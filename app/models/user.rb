class User < ActiveRecord::Base
  has_secure_password

  has_many :menus
  has_one :preference
  
  validates :name, :address, :phone_number, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
