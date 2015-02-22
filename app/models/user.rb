class User < ActiveRecord::Base
  has_secure_password

  has_many :menus

  has_one :preference
  has_one :recipe, through: :preference
  
  validates :name, :address, :phone_number, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  def allergic_to?(dish)
    allergies = recipe.ingredients.map(&:name)
    ingredients = dish.ingredients.map(&:name)

    allergies.each do |allergy|
      if ingredients.include?(allergy)
        return true
      end
    end

    false
  end
end
