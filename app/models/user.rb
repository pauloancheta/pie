class User < ActiveRecord::Base
  has_secure_password
  # before_validation :default_value

  has_many :menus, dependent: :destroy

  has_one :preference, dependent: :destroy
  has_one :recipe, through: :preference
  
  validates :name, :email, :password, :password_confirmation, presence: true
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

  # def default_value
  #   is_admin = false
  # end
end
