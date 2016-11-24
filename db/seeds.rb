require 'ffaker'



ListingAmenity.create(listing_id: 106, amenity_id: 9)
ListingAmenity.create(listing_id: 106, amenity_id: 11)
ListingAmenity.create(listing_id: 106, amenity_id: 14)
ListingAmenity.create(listing_id: 106, amenity_id: 15)



# Amenity.create(name: "WiFi", icon: "☎")
# Amenity.create(name: "Gym", icon: "⛹")
# Amenity.create(name: "Pool", icon: "🏊")
# Amenity.create(name: "Breakfast", icon: "☕")
# Amenity.create(name: "Aircon", icon: "❄")
# Amenity.create(name: "Restaurant", icon: "🍷")
# Amenity.create(name: "Free Parking", icon: "🚗")


# User.create(email: "tenant@gmail.com", password: "password", role: 0)
# User.create(email: "landlord@gmail.com", password: "password", role: 1)
# User.create(email: "admin@gmail.com", password: "password", role: 2)


#
# users = []
# 10.times do
#   user = User.create(
#   email: FFaker::Internet.disposable_email,
#   password: Time.now.to_i.to_s(36)
#   )
#   users << user
# end
#
# 50.times do
#      Listing.create(
#         address: FFaker::Address.street_address,
#         user: users.sample,
#         nightly_rate: rand(100..500),
#         no_bedrooms: rand(1..4),
#         no_bathrooms: rand(1..3)
#       )
# end
#
# Listing.all.each do |listing|
#   listing.city = FFaker::AddressAU.city,
#   listing.availale = true,
#   listing.description = FFaker::Tweet.body,
#   listing.state = FFaker::AddressAU.state,
#   listing.save
# end
