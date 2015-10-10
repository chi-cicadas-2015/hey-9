require 'rails_helper'

describe UsersController do

  describe "GET #new" do
    before{
        @user = User.create!(username:"wyeth", email: "wyteh@wyeth", password: "123")
    }
    it "should render the new user page" do
        get :new
        expect(response).to render_template(:new)
    end
   end

   describe "GET #show" do
    before {
        @user = User.create!(username:"wyeth", email: "wyteh@wyeth", password: "123")
    }
    it "should render the user\'s profile page" do
        get :show, {id: @user.id}
        expect(response).to render_template(:show)
    end
   end

   describe "POST #create" do
        it "creates a new user" do
            expect {
                post :create, {user: {username: "wyeth", email: "wyeth@wyeth", password: "123"}}
            }.to change{User.count}.by(1)
        end
   end

   describe "GET #edit" do
    before{
         @user = User.create!(username: "wyeth", email: "wyeth@wyeth", password: "123")
    }
    it "should render the edit user page" do
        get :edit, {id: @user.id}
        expect(response).to render_template(:edit)
    end
   end

   describe "PUT #update" do
    before{
        @user = FactoryGirl.create(:user)
        @user_attributes = FactoryGirl.attributes_for(:user, username: "wyeth", email: "wyeth@wyeth", password: "123")
        @user_update_attributes = FactoryGirl.attributes_for(:user, name: "Chris", email: "chris@chris", password: "123")
    }
    it "should update the user\'s information" do
        put :update, {
            :username => @user.username,
            :email => @user.email
        }
    end
   end
    # it "creates a new user" do
    #   get :new
    #   # expect
    # end

    # it "returns http success" do
    #   get :new
    #   expect(response).to be_success
    # end

    # it "renders the new template" do
    #   get :new
    #   expect(response).to render_template("new")
    # end



end

