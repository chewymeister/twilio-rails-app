class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end


#PROBLEM WITH IF LOGIC, DOESN'T CATCH SEND TEXT ERRORS
  def create
    to_number, content = params[:message][:number_to], params[:message][:content]
    from_number = provide_from_number
    client = new_twilio_client provide_sid, provide_token
    @message = Message.create message_params
    sid = @message.send_text( client, to_number, from_number, content ).sid
    response = client.account.messages.get sid

    if response.status == 'sent'
      flash[:notice] = 'Your message was sent successfully'
      redirect_to root_path
    else
      flash[:error] = ['Message did not send successfully, please try again']
      redirect_to new_message_path
    end

  end

  private
    def message_params
      params.require(:message).permit(:number_to, :content)
    end

    def provide_from_number
      if test_environment?
        TEST_VALID_FROM_NUMBER
      elsif dev_environment?
        ENV['TWILIO_LIVE_SMS_NUMBER']
      end
    end

    def provide_sid
      if test_environment?
        TEST_SID
      elsif dev_environment?
        ENV['TWILIO_LIVE_SID']
      end
    end

    def provide_token
      if test_environment?
        TEST_TOKEN
      elsif dev_environment?
        ENV['TWILIO_LIVE_TOKEN']
      end
    end

    def test_environment?
      Rails.env.test?
    end

    def dev_environment?
      Rails.env.development?
    end
end
