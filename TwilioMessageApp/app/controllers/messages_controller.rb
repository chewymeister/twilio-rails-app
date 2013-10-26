class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    to_number = params[:message][:number_to]
    content = params[:message][:content]
    from_number = provide_from_number
    @message = Message.create message_params
    client = new_twilio_client provide_sid, provide_token 
    @message.send_text( client, to_number.to_s, from_number, content )

    if @message
      flash[:notice] = 'Your message was successfully sent'
      redirect_to root_path
    else
      flash[:error] = ['Did not send message, please try again']
      redirect_to new_message_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:number_to, :content)
    end

    def provide_from_number
      if test_environment?
        ENV['TWILIO_TEST_SMS_FROM_NUMBER']
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
