class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new_twilio_client account_sid, authentication_token
    Twilio::REST::Client.new(account_sid, authentication_token)
  end
  
end
