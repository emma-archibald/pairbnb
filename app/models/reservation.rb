class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  #
  # validate :check_in_date_cannot_be_in_the_past
  #
  #   def check_in_date_cannot_be_in_the_past
  #     if check_in_date.present? && check_in_date < Date.today
  #       errors.add(:check_in_date, "can't be in the past")
  #     end
  #   end






end
