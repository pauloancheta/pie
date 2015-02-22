class User < ActiveRecord::Base
  has_secure_password
  # before_validation :default_value

  has_many :dishes

  has_many :likes
  has_many :liked_dishes, through: :likes, source: :dish

  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites

  has_many :inverse_favourites, class_name: 'Favourites', foreign_key: 'favourited_user_id'
  has_many :inverse_favourited_users, through: :inverse_favourites, source: :user

  # has_many :menus

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
