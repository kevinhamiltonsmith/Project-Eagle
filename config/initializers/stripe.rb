# Rails.configuration.stripe = {
#   :publishable_key => ENV['secret'],
#   :secret_key      => ENV['secret']
# }

puts ENV['STRIPE_KEY']
Stripe.api_key = ENV['STRIPE_KEY']