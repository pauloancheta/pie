require 'rails_helper'

RSpec.describe Menu, type: :model do

  context 'validation' do
    it { should validate_presence_of(:name) }
  end 

  context 'association' do
    it { should belong_to(:user) }

    # it { should have_many(:menu_dishes).dependent(:destroy) }
    # it { should have_many(:dishes).through(:menu_dishes) }
  end 

  context 'column specification' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

end