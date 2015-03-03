require 'rails_helper'

RSpec.describe MenusController, type: :controller do

  let!(:user)   { create(:user, is_admin: true) }
  let!(:menu)   { create(:menu, user: user) }
  let!(:menu_1) { create(:menu) }

  # # describe '#index' do 
  # #   context "user logged in" do
  # #     before { login(user) }

  # #     it "assigns menus instance variable to created menus for a user" do
  # #       get :index
  # #       expect(assigns(:menus)).to eq([menu, menu_1])
  # #     end 
  # #   end 
  # # end 

  describe '#create' do 
    context "user logged in" do 
      before { login(user) }

      context "with valid parameters" do
        def valid_request
          post :create, {menu: {
                         name: "Valid name"
                        }, user_id: user.id, format: :js}
        end
        it "adds a menu to the database for current user" do
          expect { valid_request }.to change { user.menus.count }.by(1)
        end 
      end

    end 
  end

   
end
