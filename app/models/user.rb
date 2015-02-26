class User < ActiveRecord::Base
  has_secure_password

  #not being used or not supposed to be used?
  has_many :dishes

  #associations used by both admin and non-admin
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites

  has_many :inverse_favourites, class_name: 'Favourites', foreign_key: 'favourited_user_id'
  has_many :inverse_favourited_users, through: :inverse_favourites, source: :user

  #associations used by admin
  has_many :menus, dependent: :destroy
  has_many :recipes, dependent: :destroy

  has_many :likes, dependent: :nullify
  has_many :liked_dishes, through: :likes, source: :dish

  #associations used by non-admin
  has_one :preference, dependent: :destroy
  has_one :recipe, through: :preference

  #validations  
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  #show the current_users' favorite admin users
  def favourite_for(user)
    favourites.where(user: user).first
  end

  #search database for admins
  def self.search(search)
    if search
      where("name ILIKE '%#{search}%' ")
    else
      unscoped
    end
  end

  #used to check if the user is allergic to/does not like a specific ingredient
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

  #cross reference diet to ingredient categories
  def diet_restriction?(dish)
    ingredients = dish.ingredients.map(&:category)

    vegan_array = ["Poultry", "Beef", "Pork", "Seafood", "Dairy/Eggs"]
    vegetarian_array = ["Poultry", "Beef", "Pork", "Seafood"]
    pesq_array = ["Poultry", "Beef", "Pork"]
    muslim_array = ["Pork"]
    dairy_array = ["Dairy/Eggs"]
    gluten_array = ["Grains/Wheat"]

    if self.preference.diet == "Vegan"
      vegan_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    elsif self.preference.diet == "Vegetarian"
      vegetarian_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    elsif self.preference.diet == "Pesquitarian"
      pesq_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    elsif self.preference.diet == "Muslim"
      muslim_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    elsif self.preference.diet == "Dairy-free"
      dairy_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    elsif self.preference.diet == "Gluten-free"
      gluten_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    end
    false
    # case self.preference.diet
    # when "Vegan"
    #   return check_ingredients(vegan_array)
    # when "Vegetarian"
    #   return check_ingredients(vegetarian_array)
    # when "Pesquitarian"
    #   return check_ingredients(pesq_array)
    # when "Muslim"
    #   return check_ingredients(muslim_array)
    # when "Dairy-free"
    #   return check_ingredients(dairy_array)
    # when "Gluten-free"
    #   return check_ingredients(gluten_array)
    # else
    #   return false
    # end
  end

  #loop through the ingredient categories and match an ingredient
  def check_ingredients(ingredient_array)
    ingredient_categories = recipe.ingredients.map(&:category)  

    ingredient_array.each do |ingredient|
      if ingredient_categories.include?(ingredient)
        return true
      end
    end
  end

end
