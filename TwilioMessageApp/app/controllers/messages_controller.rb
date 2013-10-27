class MessagesController < ApplicationController

  rescue_from Twilio::REST::RequestError, :with => :catch_exception

  def index
  end

  def new
    @message = Message.new
  end

  def create
    @to_number, @content = params[:message][:number_to], params[:message][:content]
    @from_number = provide_from_number
    @client = new_twilio_client provide_sid, provide_token
    @message = Message.create message_params

    if test_environment?
      test_redirect_message
    elsif development_environment?
      development_redirect_message
    end

  end

  private
    def message_params
      params.require(:message).permit(:number_to, :@content)
    end

    def catch_exception
      flash[:errors] = ['Message did not send successfully, please try again']
      redirect_to new_message_path
    end

    def development_redirect_message
      sid = @message.send_text( @client, @to_number, @from_number, @content ).sid
      response = @client.account.messages.get sid
      if response.status == 'sent'
        flash[:notice] = 'Your message was successfully sent'
        redirect_to root_path
      else
        catch_exception
      end
    end

    def test_redirect_message
      status = @message.send_text( @client, @to_number, @from_number, @content ).status
      if status == 'queued'
        flash[:notice] = 'Your message was successfully sent'
        redirect_to root_path
      else
        catch_exception
      end
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
