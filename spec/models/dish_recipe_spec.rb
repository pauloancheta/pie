require 'rails_helper'

RSpec.describe DishRecipe, type: :model do

  context 'association' do
    it { should belong_to(:recipe) }
    it { should belong_to(:dish) }
  end

  context 'column_specification' do
    it { should have_db_column(:recipe_id).of_type(:integer) }
    it { should have_db_column(:dish_id).of_type(:integer) }
  end

end
