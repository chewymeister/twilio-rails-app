class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    number = params[:message][:number]
    content = params[:message][:content]
    from_number = ENV['TWILIO_LIVE_SMS_NUMBER']
    @message = Message.create message_params
    client = @message.new_twilio_client ENV['TWILIO_LIVE_SID'], ENV['TWILIO_LIVE_TOKEN']
    @message.send_text(client,'+441904500952', number, content)

    if @message.status == 'queued'
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
end
