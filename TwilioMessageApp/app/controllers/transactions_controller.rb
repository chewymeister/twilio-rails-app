class TransactionsController < ApplicationController
  before_filter :auth_user

  def new
    # @transaction = Transaction.new
  end

  def create
    # Amount in cents
    @amount = to_pennies params[:amount]
    token = params[:stripeToken]
    @transaction = Transaction.new transaction_amount: @amount
    @transaction.attempt_charge @amount, token
    @user = User.find current_user.id
    puts "HELLO #{@user.credit}"
    @user.credit += @amount


    flash[:notice] = "Your credit is now £#{present_in_pounds @user.credit}"
    redirect_to root_path
  end

  private
  def to_pennies amount
    (amount.to_f * 100).round
  end
  
  def present_in_pounds pennies
    pounds = pennies.to_f / 100
    sprintf('%.2f', pounds)
  end

  def auth_user
    unless user_signed_in?
      flash[:notice] = "You need to sign in before you can send a text"
      redirect_to new_user_session_path
    end
  end
end
