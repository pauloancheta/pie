require 'rails_helper'

RSpec.describe MenuDish, type: :model do

  context 'association' do
    it { should belong_to(:menu) }
    it { should belong_to(:dish) }  
  end

  context 'column specification' do
    it { should have_db_column(:menu_id).of_type(:integer) }
    it { should have_db_column(:dish_id).of_type(:integer) }
  end

end