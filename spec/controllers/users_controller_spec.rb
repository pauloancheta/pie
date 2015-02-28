require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    it "doesnt allow the creation of a user with no information given" do
      user = User.new
      expect(user).to_not be_valid
    end
  end
  describe "#create" do
    context "valid request" do
      def valid_request_user
        post :create, {user: {name: 'brandyn',
                              address: '1234 Lol Road',
                              phone_number: '123 123 1234',
                              email: 'brandyn.prasad@gmail.com',
                              password: 'lol123',
                              password_confirmation: 'lol123'}}
      end

      def valid_request_admin
        post :create, {user: {is_admin: true,
                              name: 'brandyn',
                              address: '1234 Lol Road',
                              phone_number: '123 123 1234',
                              email: 'brandyn.prasad@gmail.com',
                              password: 'lol123',
                              password_confirmation: 'lol123'}}
      end
    
      it "creates a new user record in the database as a regular user" do
        expect {valid_request_user}.to change {User.count}.by(1)
      end
      
      it "creates a new user record in the database as an admin" do
        expect {valid_request_admin}.to change {User.count}.by(1)
      end

      it "redirects to home page" do
        valid_request_user
        expect(response).to redirect_to '/'
      end
      
      it "sets a flash message when a new regular user is created" do
        valid_request_user
        expect(flash[:alert]).to be
      end
      
      it "sets a flash message when a new admin user is created" do
        valid_request_admin
        expect(flash[:alert]).to be
      end
    end
    
    context "invalid request" do
      def invalid_request_user
        post :create, {user: {name: 'brandyn',
                              address: '1234 Lol Road',
                              phone_number: '123 123 1234',
                              email: 'brandyn.prasad@gmail.com',
                              password: 'lol123',
                              password_confirmation: 'lol321'}}
      end
      
      def invalid_request_admin
        post :create, {user: {is_admin: true,
                              name: 'brandyn',
                              address: '1234 Lol Road',
                              phone_number: '123 123 1234',
                              email: 'brandyn.prasad@gmail.com',
                              password: 'lol123',
                              password_confirmation: 'lol'}}
      end
    
      it "doesn't create a new record in database as a invalid regular user" do
        expect {invalid_request_user}.not_to change {User.count}
      end 

      it "doesn't create a new record in database as an invalid admin" do
        expect {invalid_request_admin}.not_to change {User.count}
      end 

      it "sets a flash message when trying to create an invalid regular user" do
        invalid_request_user
        expect(flash[:alert]).to be
      end

      it "sets a flash message when trying to create an invalid admin user" do
        invalid_request_admin
        expect(flash[:alert]).to be
      end

      it "redirects to sign up page when trying to create invalid regular user" do
        invalid_request_user
        expect(response).to redirect_to root_path
      end

      it "redirects to sign up page when trying to create invalid admin user" do
        invalid_request_admin
        expect(response).to redirect_to root_path
      end
    end
  end
end
