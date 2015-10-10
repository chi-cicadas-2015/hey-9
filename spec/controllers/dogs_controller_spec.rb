require 'rails_helper'

describe DogsController do
  describe "GET #new" do
    before{
      @user = User.create!(username:"wyeth", email: "wyteh@wyeth", password: "123")
      @dog = Dog.create!(name: "cutiepie", owner_id: @user.id)
    }
    it 'should render the new dog page' do
      get :new, {user_id: @user.id}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    before{
      @user = User.create!(username:"wyeth", email: "wyteh@wyeth", password: "123")
      @dog = Dog.create!(name: "cutiepie", owner_id: @user.id)
    }
    it 'should render the dog\'s profile page' do
      get :show, {id: @dog.id, user_id: @user.id}
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    before{
      @user = User.create!(username: "wyeth", email: "wyeth@wyeth", password: "123")
    }
    it "creates a new dog" do
      expect {
        post :create, {user_id: @user.id, dog: {name: "Kira", owner_id: @user.id}}
      }.to change{Dog.count}.by(1)
    end
  end

  describe "GET #edit" do
    before {
      @user = User.create!(username: "wyeth", email: "wyeth@wyeth", password: "123")
      @dog = Dog.create!(name: "cutiepie", owner_id: @user.id)
    }
    it 'should render the edit dog page' do
      get :edit, {user_id: @user.id, id: @dog.id}
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    before{
    @user = FactoryGirl.create(:user)
    FactoryGirl.attributes_for(:user, username: "wyeth", email: "wyeth@wyeth", password: "123")
    @dog = FactoryGirl.create(:dog, user: @user)
    @dog_attributes = FactoryGirl.attributes_for(:dog, :user_id => @user.id, :name => "cutiepie")
    @dog_update_attributes = FactoryGirl.attributes_for(:dog, :name => "Kira", :user_id => @user.id)
  }
    it 'should update the dog\'s information' do
        put :update, {
        :user_id => @user.id,
        :id => @dog.id
        :dog => @dog_update_attributes
        }
    end
  end

  describe "POST add_connection" do

  end
end
