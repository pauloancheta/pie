class User < ActiveRecord::Base
  has_secure_password

  validates :name, :address, :phone_number, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
