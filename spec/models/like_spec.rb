require 'rails_helper'

RSpec.describe Like, type: :model do

  context 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:dish) }
  end

  context 'column specification' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:dish_id).of_type(:integer) }
  end

end