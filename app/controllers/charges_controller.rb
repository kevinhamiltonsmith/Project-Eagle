class ChargesController < ApplicationController
  def new
    puts "*"*100
  end

  def create
    # Amount in cents
    Stripe.api_key = 'sk_test_WJKjg9zfVpCrB5vTryRfb9Jf'

    @resId = params[:resId]
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => params[:email],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @reservation = Reservation.find_by_id(@resId)
    if(!@reservation.blank?)
      @reservation.total = 'PAID'
      @reservation.save
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
end
