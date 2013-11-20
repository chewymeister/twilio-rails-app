class TransactionsController < ApplicationController
  before_filter :auth_user

  def new
    # @transaction = Transaction.new
  end

  def create
    # Amount in cents
    @amount = params[:amount]
    token = params[:stripeToken]
    @transaction = Transaction.new amount: params[:amount]
    @user = User.find current_user

    if @transaction.attempt_charge(@amount, token) == 'successful'
      @user.credit += @amount
      redirect_to root_path
      flash[:notice] = "Thanks, your credit is now £#{@user.credit}!"
    else
      # rescue Stripe::CardError => e
        flash[:error] = 'error'
        redirect_to new_transaction_path
      # end
    end
  end

  private

  def auth_user
    unless user_signed_in?
      flash[:notice] = "You need to sign in before you can send a text"
      redirect_to new_user_session_path
    end
  end
end
