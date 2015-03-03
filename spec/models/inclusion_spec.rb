require 'rails_helper'

RSpec.describe Inclusion, type: :model do

  context 'association' do
    it { should belong_to(:recipe) }
    it { should belong_to(:ingredient) }
  end

  context 'column specification' do
    it { should have_db_column(:recipe_id).of_type(:integer) }
    it { should have_db_column(:ingredient_id).of_type(:integer) }
  end

end
