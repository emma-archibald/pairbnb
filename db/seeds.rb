require 'ffaker'

50.times do
     Listing.create(
        address: FFaker::Address.street_address,
        user_id: rand(1..10),
        nightly_rate: rand(100..500),
        no_bedrooms: rand(1..4),
        no_bathrooms: rand(1..3)
      )
end
