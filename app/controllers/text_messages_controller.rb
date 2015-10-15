class TextMessagesController < ActionController::Base
include ApplicationHelper

  def send_text_message
    @app_number = "+17734928893"
    @user_numbers = params[:user_numbers]
    @alert_message = "[ALERT]: #{params[:dog]} is lost in your neighborhood, please be on the lookout"
    account_sid = Rails.application.secrets.twilio_account_sid
    auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    if @user_numbers != nil && @user_numbers.is_a?(Array)
      @user_numbers.each do |number|
        phone = number.phone_number.gsub(/\D/,"")
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
