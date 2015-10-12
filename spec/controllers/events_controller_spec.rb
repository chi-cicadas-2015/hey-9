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
    it "assigns a new Contact to @contact"
    it "renders the new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact to the database"
      it "redirects to creator dashboard"
    end
    context "with invalid attributes" do
      it "does not update the contact"
      it "re-renders the edit template"
    end
  end

  describe "GET #edit" do
    it "assigns the requested event to @event"
    it "renders the edit template"

  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the event in the database"
      it "redirects to the dashboard"
    end
    context "with invalid attributes" do
      it "does not update the contact"
      it "re-render the edit template"
    end

  end

  describe "DELETE #destroy" do
    it "deletes the event from the database"
    it "redirects to dashboard"
  end

end
