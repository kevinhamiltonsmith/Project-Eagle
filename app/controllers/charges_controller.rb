class ChargesController < ApplicationController
  def new
    puts "*"*100
  end

  def create
    # Amount in cents
    Stripe.api_key = 'sk_test_WJKjg9zfVpCrB5vTryRfb9Jf'

    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
