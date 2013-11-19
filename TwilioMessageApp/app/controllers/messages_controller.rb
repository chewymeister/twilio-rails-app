class MessagesController < ApplicationController
  before_filter :auth_user
  rescue_from Twilio::REST::RequestError, :with => :catch_exception

  def index
    @message = Message.new
  end

  def create
    @to_number, @content = params[:message][:number_to], params[:message][:content]
    @from_number = provide_from_number
    @client = new_twilio_client provide_sid, provide_token
    @message = Message.create message_params

    if test_environment?
      send_test_text_and_show_message
    elsif dev_environment?
      send_live_text_and_show_message
    end
  end

  private
    def auth_user
      unless user_signed_in?
        flash[:notice] = "You need to sign in before you can send a text"
        redirect_to new_user_session_path
      end
    end

    def message_params
      params.require(:message).permit(:number_to, :@content)
    end

    def catch_exception
      flash[:errors] = ['Message did not send successfully, please try again']
      redirect_to root_path
    end

    def send_live_text_and_show_message
      sid = @message.send_text( @client, @to_number, @from_number, @content ).sid
      response = @client.account.messages.get sid
      if response.status == 'sent'
        flash[:notice] = 'Your message was successfully sent'
      else
        catch_exception
      end
    end

    def send_test_text_and_show_message
      status = @message.send_text( @client, @to_number, @from_number, @content ).status
      if status == 'queued'
        flash[:notice] = 'Your message was successfully sent'
      else
        catch_exception
      end
    end
#TEST CREDENTIALS CONTAINED IN CONFIG/INITIALIZERS/TWILIO_TEST_CREDENTIALS.RB

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
