require 'spec_helper'

describe Message do
    let(:message) { Message.new }
    let(:client) {new_twilio_client TEST_SID, TEST_TOKEN}

  context 'when sending to a valid number' do
    it 'should receive a successful response from twilio' do
      body = 'Hello, world'
      to_number = TEST_VALID_TO_NUMBER
      from_number = TEST_VALID_FROM_NUMBER
      expect(message.send_text(client, to_number, from_number, body).status).to eq 'queued'
    end
  end

  context 'when sending to an invalid number' do
    it 'should receive an unsuccessful response from twilio' do
      body = 'Hello, world'
      to_number = TEST_INVALID_TO_NUMBER
      from_number = TEST_VALID_FROM_NUMBER
      error = Twilio::REST::RequestError
      expect {message.send_text(client, to_number, from_number, body)}.to raise_error(error)
    end
  end
end