class AddPaymentIdToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :payment, foreign_key: true
  end
end
