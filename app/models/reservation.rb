class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  belongs_to :payment

  validates :check_in_date, inclusion: { in: (Date.today..Date.today+5.years) }
  validate :check_out_after_check_in
  validate :not_previously_booked, :on => :create 

  def check_out_after_check_in
    if check_out_date < check_in_date
      errors.add(:check_out_date, "Check-out must be after check-in")
    end
  end

  def not_previously_booked

    already_booked_dates = []
    listing = self.listing
    reservations = listing.reservations.all
    reservations.each do |res|
      date_range = (res.check_in_date..res.check_out_date)
      date_range.each do |n|
        already_booked_dates << n
      end
      booking_dates = ((self.check_in_date)..(self.check_out_date))
      booking_dates.each do |date|
        if already_booked_dates.include?(date)
          errors.add(:check_in_date, "Dates are already booked")
        end
      end
    end
  end

end
