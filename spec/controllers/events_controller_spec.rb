require 'rails_helper'
include ApplicationHelper

describe EventsController do

  before {
    @creator = create(:creator)
    @event = create(:event)
    set_user_session(@creator) # session[:user_id] = @creator.id
  }

  describe "GET #index" do
    it "assigns a collection of events to @events"
    it "renders the index view"

  end

  describe "GET #show" do
    it "assigns the requested event to @event" do
      get :show, id: @event
      expect(assigns(:event)).to eq(@event)
    end
    it "renders the show template" do
      get :show , id: @event
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Event to @event" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact to the database" do
        expect { post :create, event: attributes_for(:event) }.to change(Event, :count).by(1)
      end
      it "redirects to event page" do
        post :create, event: attributes_for(:event)
        expect(response).to redirect_to event_path(assigns[:event])
      end
    end
    context "with invalid attributes" do
      it "does not update the contact" do
        expect { post :create, event: attributes_for(:event, event_start: nil) }.not_to change(Event, :count)
      end
      it "re-renders the edit template" do
        post :create, event: attributes_for(:event, event_start: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested event to @event" do
      get :edit, id: @event
      expect(assigns(:event)).to eq(@event)
    end
    it "renders the edit template" do
      get :edit, id: @event
      expect(response).to render_template :edit
    end

  end

  describe "PATCH #update" do
    context "with valid attributes" do

      before :each do
        patch :update, id: @event, event: attributes_for(:event, description: "Leila's b-day")
      end

      it "locates the requested @event" do
        expect(assigns(:event)).to eq(@event)
      end
      it "updates the event in the database" do
        @event.reload
        expect(@event.description).to eq("Leila's b-day")
      end
      it "redirects to the event page" do
        expect(response).to redirect_to @event
      end
    end
    context "with invalid attributes" do

      before :each do
        patch :update, id: @event, event: attributes_for(:event, description: "")
      end

      it "locates the requested @event" do
        expect(assigns(:event)).to eq @event
      end
      it "does not update the contact" do
        expect(assigns(:event).reload.attributes).to eq @event.attributes
      end
      it "re-renders the edit template" do
        expect(response).to render_template :edit
      end
    end

  end

  describe "DELETE #destroy" do
    it "deletes the event from the database" do
      expect { delete :destroy, id: @event }.to change(Event, :count).by(-1)
    end
    it "redirects to creator" do
      delete :destroy, id: @event
      expect(response).to redirect_to @creator
    end
  end

  describe "Guest access" do

    before :each do
      allow(controller).to receive(:current_user)
    end

    describe "GET#new" do
      it "redirects to login" do
        get :new
        expect(response).to redirect_to new_session_path
      end
    end

    describe "GET#edit" do
      it "redirects to login" do
        get :edit, id: @event
        expect(response).to redirect_to new_session_path
      end
    end

    describe "POST#create" do
      it "redirects to login" do
        post :create, id: @event
        expect(response).to redirect_to new_session_path
      end
    end

    describe "PUT#update" do
      it "redirects to login" do
        put :update, id: @event
        expect(response).to redirect_to new_session_path
      end
    end

    describe "DELETE#destroy" do
      it "redirects to login" do
        delete :destroy, id: @event
        expect(response).to redirect_to new_session_path
      end
    end

  end

end
