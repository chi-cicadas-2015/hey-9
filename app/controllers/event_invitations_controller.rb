class EventInvitationsController < ApplicationController
  include ApplicationHelper

  def create
    # @event = Event.find_by(id: params[:event_id])
  	@event_invitation = EventInvitation.create!(event_id: params[:event_id], invitee_id: params[:invitee_id])
    redirect_to "/events/#{params[:event_id]}"
  end

  def destroy
  	@event_invitation.destroy
  	redirect_to 'events/index'
  end
end