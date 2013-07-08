class ChargesController < ApplicationController
  def new
    puts "*"*100
  end

  def create
    begin
      # Amount in cents
      Stripe.api_key = 'sk_test_WJKjg9zfVpCrB5vTryRfb9Jf'

      @reservation_id = params[:resId]
      @reservation = Reservation.find_by_id(@reservation_id)
      total = @reservation.total + '00'

      customer = Stripe::Customer.create(
        :email => params[:email],
        :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => total,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      if(!@reservation.blank?)
        @reservation.paid = '1'
        @reservation.save
      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end

    redirect_to :back # :action => 'index', :controller

  end
end
