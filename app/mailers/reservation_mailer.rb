class ReservationMailer < ApplicationMailer
   default from: 'emma.jane1147@gmail.com'

  def booking_email (customer, host, reservation_id)
    @customer = customer
    @host = host
    @reservation = Reservation.find(reservation_id)
    @listing = @reservation.listing
    # @url = url_for([@listing, @reservation])

    mail(to: 'archibald.ej@gmail.com', subject: 'Booking Confirmation')
  end
end
