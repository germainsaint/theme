namespace :stripe_pay do
  desc "Stripe pay"
  task create_token: :environment do
    Stripe.api_key = "sk_test_rTxyFQAuEqMjT0DJ0XPGzFYU"

    charge = Stripe::Charge.create({
                                       amount: 999,
                                       currency: 'usd',
                                       source: 'tok_visa',
                                       receipt_email: 'vidur@onsinteractive.com',
                                   })
    puts charge
  end

end
