require 'ffaker'

users = []
10.times do
  user = User.create(
  email: FFaker::Internet.disposable_email,
  password: Time.now.to_i.to_s(36)
  )
  users << user
end

50.times do
     Listing.create(
        address: FFaker::Address.street_address,
        user: users.sample,
        nightly_rate: rand(100..500),
        no_bedrooms: rand(1..4),
        no_bathrooms: rand(1..3)
      )
end

Listing.all.each do |listing|
  listing.city = FFaker::AddressAU.city,
  listing.availale = true,
  listing.description = FFaker::Tweet.body,
  listing.state = FFaker::AddressAU.state,
  listing.save
end
