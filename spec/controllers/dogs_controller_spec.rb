require 'rails_helper'

describe DogsController do
  describe "GET #new" do
    before{
      @user = User.create!(username:"wyeth", email: "wyteh@wyeth", password: "123")
      @dog = Dog.create!(name: "cutiepie", owner_id: @user.id)

    }
    it 'should render the new dog page' do
       session[:user_id] = @user.id
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
       session[:user_id] = @user.id
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
      session[:user_id] = @user.id
      get :edit, {id: @dog.id}
      expect(response).to render_template(:edit)
    end
  end

end
