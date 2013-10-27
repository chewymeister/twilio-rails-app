module ApplicationHelper

  # def new_twilio_client account_sid, authentication_token
  #   Twilio::REST::Client.new(account_sid, authentication_token)
  # end
  def new_twilio_client account_sid, authentication_token
    Twilio::REST::Client.new(account_sid, authentication_token)
  end
  
end
