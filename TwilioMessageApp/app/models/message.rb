class Message < ActiveRecord::Base

  def new_twilio_client account_sid, authentication_token
    Twilio::REST::Client.new(account_sid, authentication_token)
  end

  def send_text client, to_number, from_number, body
    client.account.sms.messages.create(
      from: from_number,
      to: to_number,
      body: body)
  end
end
