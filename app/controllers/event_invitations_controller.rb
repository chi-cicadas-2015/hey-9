class EventInvitationsController < ApplicationController
  include ApplicationHelper

  def create
  	@event_invitation = Event_invitation.new(event_invitation_params)
  end

  def destroy
  	@event_invitation.destroy
  	redirect to 'events/index'
  end

  private

  def event_invitation_params
    params.require(:event_invitation).permit(:event_id, :invitee_id)
  end

end