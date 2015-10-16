class TextMessagesController < ActionController::Base
include ApplicationHelper

  def send_text_message
    @app_number = "+17734928893"
    @user_numbers =  User.where(receive_notices: true).pluck(:phone_number)
    @alert_message = "[ALERT]: #{params[:dog]} is lost in your neighborhood. Please contact the owner with any information."
    account_sid = Rails.application.secrets.twilio_account_sid
    auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    if @user_numbers != nil
      @user_numbers.each do |number|
        phone = number.gsub(/\D/,"")
        message = @client.account.messages.create(
          from: @app_number,
          to: "+1#{phone}",
          body: @alert_message
        )
      end
    end
    redirect_to "/users/#{current_user.id}/dogs"
  end

end
