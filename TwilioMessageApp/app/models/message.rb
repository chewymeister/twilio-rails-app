class Message < ActiveRecord::Base

  def send_text client, to_number, from_number, body
    client.account.sms.messages.create(
      from: from_number,
      to: to_number,
      body: body)
  end
  
end
