class User < ActiveRecord::Base
  has_secure_password
  # before_validation :default_value

  #not being used or not supposed to be used?
  has_many :dishes

  has_many :likes
  has_many :liked_dishes, through: :likes, source: :dish

  has_many :favourites
  has_many :favourited_users, through: :favourites

  has_many :inverse_favourites, class_name: 'Favourites', foreign_key: 'favourited_user_id'
  has_many :inverse_favourited_users, through: :inverse_favourites, source: :user

  has_many :menus, dependent: :destroy

  has_one :preference, dependent: :destroy
  has_one :recipe, through: :preference

  has_many :recipes
  
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

    return false
  end

  def favourite_for(user)
    favourites.where(user: user).first
  end

  def diet_restriction?(user)
    vegan_array = ["Poultry", "Beef", "Pork", "Seafood", "Dairy/Eggs"]
    vegetarian_array = ["Poultry", "Beef", "Pork", "Seafood"]
    pesq_array = ["Poultry", "Beef", "Pork"]
    muslim_array = ["Pork"]
    dairy_array = ["Dairy/Eggs"]
    gluten_array = ["Grains/Wheat"]


    case self.preference.diet
    when "Vegan"
      return check_ingredients(vegan_array)
    when "Vegetarian"
      return check_ingredients(vegetarian_array)
    when "Pesquitarian"
      return check_ingredients(pesq_array)
    when "Muslim"
      return check_ingredients(muslim_array)
    when "Dairy-free"
      return check_ingredients(dairy_array)
    when "Gluten-free"
      return check_ingredients(gluten_array)
    else
      false
    end
  end

  def check_ingredients(ingredient_array)
    ingredient_categories = recipe.ingredients.map(&:category)  

    ingredient_array.each do |ingredient|
      if ingredient_categories.include?(ingredient)
        return true
      end
    end
  end

end
