class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates :check_in_date, inclusion: { in: (Date.today..Date.today+5.years) }
  validate :check_out_after_check_in

  def check_out_after_check_in
    if check_out_date < check_in_date
      errors.add(:check_out_date, "Check-out must be after check-in")
    end
  end

end
