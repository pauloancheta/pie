require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:admin)}

  describe "#new" do
    it "sets a new user instance" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "#create" do
    context "successful login" do
      def valid_user_request 
          post :create, email: user.email, password: user.password
      end

      def valid_admin_request 
          post :create, email: admin.email, password: admin.password
      end

      it "sets the user_id session variable for a regular user" do
        valid_user_request
        expect(session[:user_id]).to eq(user.id)
      end

      it "sets the user_id session variable for a regular user" do
        valid_admin_request
        expect(session[:user_id]).to eq(admin.id)
      end

      it "redirects to the restaurants path for a regular user" do
        valid_user_request
        expect(response).to redirect_to '/restaurants'
      end

      it "redirects to the user menus path for an admin user" do
        valid_admin_request
        expect(response).to redirect_to user_menus_path(admin)
      end

      it "sets a flash alert as a regular user" do
        valid_user_request
        expect(flash[:notice]).to be
      end

       it "sets a flash alert as an admin user" do
        valid_admin_request
        expect(flash[:notice]).to be
      end
    end

    context "unsuccessful login" do
      def invalid_user_request
        post :create, email: nil, password: user.password
      end

      def invalid_admin_request 
          post :create, email: nil, password: admin.password
      end

      it "doesnt set the user_id as sessions variable for a regular user" do
        invalid_user_request
        expect(session[:user_id]).not_to be
      end

      it "doesnt set the user_id as sessions variable for an admin user" do
        invalid_admin_request
        expect(session[:user_id]).not_to be
      end

      it "redirects to login page as a regular user" do
        invalid_user_request
        expect(response).to redirect_to '/login'
      end

      it "redirects to login page as an admin user" do
        invalid_admin_request
        expect(response).to redirect_to '/login'
      end

      it "sets a flash alert for unsuccessful login as a regular user" do
        invalid_user_request
        expect(flash[:alert]).to be
      end

      it "sets a flash alert for unsuccessful login as an admin user" do
        invalid_admin_request
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#destroy" do
    context "as a regular user" do
      before do
        login(user)
        delete :destroy
      end

      it "removes the session user_id variable" do
        expect(session[:user_id]).not_to be
      end

      it "redirects to the login page" do
        expect(response).to redirect_to '/login'
      end

      it "sets a flash notice upon logging out" do
        expect(flash[:notice]).to be
      end
    end
    
    context "as an admin user" do
      before do
        login(admin)
        delete :destroy
      end

      it "removes the session user_id variable" do
        expect(session[:user_id]).not_to be
      end

      it "redirects to the login page" do
        expect(response).to redirect_to '/login'
      end

      it "sets a flash notice upon logging out" do
        expect(flash[:notice]).to be
      end
    end
  end
end
