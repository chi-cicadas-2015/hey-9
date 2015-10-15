class TextMessagesController < ActionController::Base

  def send_text_message(user_numbers, dog)
    @app_number = "+17734928893"
    @user_numbers = user_numbers
    @alert_message = "[ALERT]: #{dog} is lost in your neighborhood, please be on the lookout"
    account_sid = Rails.application.secrets.twilio_account_sid
    auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @user_numbers.each do |number|
      phone = number.phone_number.gsub(/\D/,"")
      message = @client.account.messages.create(
        from: @app_number,
        to: "+1#{phone}",
        body: @alert_message
      )
    end

    "Your alert has been sent to the neighborhood"
  end

end
