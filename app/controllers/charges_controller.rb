class ChargesController < ApplicationController
  def new
    puts "*"*100
    # # Set your secret key: remember to change this to your live secret key in production
    # # See your keys here https://manage.stripe.com/account
    # Stripe.api_key = 'sk_test_WJKjg9zfVpCrB5vTryRfb9Jf'

    # # Get the credit card details submitted by the form
    # token = params[:stripeToken]

    # # Create the charge on Stripe's servers - this will charge the user's card
    # begin
    #   charge = Stripe::Charge.create(
    #     :amount => 1000, # amount in cents, again
    #     :currency => "usd",
    #     :card => token,
    #     :description => "payinguser@example.com"
    #   )
    # rescue Stripe::CardError => e
    #   # The card has been declined
    # end
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
