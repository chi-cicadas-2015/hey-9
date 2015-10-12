require 'rails_helper'

describe EventsController do

  before {
    @creator = create(:creator)
    @event = create(:event)
    session[:user_id] = @creator.id
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
      it "updates the event in the database" do
        patch :update, id: @event, event: attributes_for(:event)
        expect(assigns(:event)).to eq(@event)
      end
      it "redirects to the event page" do
        patch :update, id: @event, event: attributes_for(:event)
        expect(response).to redirect_to @event
      end
    end
    context "with invalid attributes" do
      # it "does not update the contact" do
      #   patch :update, id: @event, event: attributes_for(:event)
      #   @event.reload
      #   expect(@event)
      # end
      it "re-renders the edit template"
    end

  end

  describe "DELETE #destroy" do
    it "deletes the event from the database"
    it "redirects to dashboard"
  end

end
