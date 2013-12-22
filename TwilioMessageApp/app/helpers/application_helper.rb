module ApplicationHelper

  def new_twilio_client account_sid, authentication_token
    Twilio::REST::Client.new(account_sid, authentication_token)
  end

  def present_in_pounds pennies
    pounds = pennies.to_f * 100
    sprintf('%.2f', pounds)
  end
end
