class Transaction < ActiveRecord::Base
  belongs_to :user

  def attempt_charge amount, stripe_token
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => stripe_token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )
    rescue Stripe::CardError => e
      flash[:error] = 'error'
      redirect_to new_transaction_path
  end
end
