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
    ingredient_categories = recipe.ingredients.map(&:category)

    case self.preference.diet
    when "Vegan"
      ["Poultry", "Beef", "Pork", "Seafood", "Dairy/Eggs"].each do |vegan|
        if ingredient_categories.include?(vegan)
          return true
        end
      end
    when "Vegetarian"
      ["Poultry", "Beef", "Pork", "Seafood"].each do |vegetarian|
        if ingredient_categories.include?(vegetarian)
          return true
        end
      end
    when "Pesquitarian"
      ["Poultry", "Beef", "Pork"].each do |pesq|
        if ingredient_categories.include?(pesq)
          return true
        end
      end
    when "Muslim"
      if ingredient_categories.include?("Pork")
        return true
      end
    when "Dairy-free"
      if ingredient_categories.include?("Dairy/Eggs")
        return true
      end
    when "Gluten-free"
      if ingredient_categories.include?("Grains/Wheat")
        return true
      end
    else
      false
    end
  end


















end
