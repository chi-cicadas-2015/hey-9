class TextMessagesController < ActionController::Base

  def send_text_message
    @app_number = "+17734928893"
    @user_number = "+13125663831"
    @alert_message = "[Alert] Inclement weather forecasted for the next hour"
    p "Account SID"
    p account_sid = Rails.application.secrets.twilio_account_sid
    p "Auth token"
    p auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.account.messages.create(
      from: @app_number,
      to: @user_number,
      body: @alert_message
    )
    puts message.to
  end

end
