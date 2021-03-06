class User < ActiveRecord::Base
  has_secure_password validations: false
  serialize :omniauth_raw_data

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
  validates :name, :email, presence: true
  validates :password, presence: true, :unless => :uid_provided?
  validates_confirmation_of :password, :unless => :uid_provided?
  validates :email, uniqueness: true, :unless => :uid_provided?
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates


  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.where(uid: auth_hash["uid"]).first
    unless user
      #create user
      user = User.new(provider: auth_hash["provider"],
                         uid: auth_hash["uid"],
                         name: auth_hash["info"]["name"],
                         email: auth_hash["info"]["email"],
                         omniauth_raw_data: auth_hash,
                         is_admin: false
                         )                  
      user.save!

      r = Recipe.new
      r.name = "Allergy for user #{user.id}"
      r.save!

      p = Preference.new
      p.user_id = user.id
      p.recipe_id = r.id
      p.save
    end
    user
  end

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
    kosher_array = ["Pork"]
    dairy_array = ["Dairy/Eggs"]
    gluten_array = ["Wheat"]

    if find_diet("Vegan", vegan_array, ingredients)
      return true
    elsif find_diet("Vegetarian", vegetarian_array, ingredients)
      return true
    elsif find_diet("Pesquitarian", pesq_array, ingredients)
      return true
    elsif find_diet("Kosher", kosher_array, ingredients)
      return true
    elsif find_diet("Dairy-free", dairy_array, ingredients)
      return true
    elsif find_diet("Gluten-free", gluten_array, ingredients)
      return true
    else
      return false
    end   
  end

  def find_by_description(dish)
    description = dish.description.downcase.gsub(',', '').split(' ').map(&:singularize)
    allergies = recipe.ingredients.map(&:name)
    diet = preference.diet

    allergies.each do |allergy| 
      if description.include?(allergy)
        return true
      end
    end

    case diet
    when "Vegan"
      return true if description.include?("chicken" || "duck" || "beef" || "fish" || "bass" || "cream")
    end

    return false
  end

  private
  def uid_provided?
    uid 
  end

  def find_diet(diet, diet_array, ingredients)
    if self.preference.diet == diet
      diet_array.each do |a|
        if ingredients.include?(a)
          return true
        end
      end
    end
    return false
  end

end