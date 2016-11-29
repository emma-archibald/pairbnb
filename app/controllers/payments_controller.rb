class PaymentsController < ApplicationController
  protect_from_forgery except: :create

  def client_token
  render json: Braintree::ClientToken.generate
  end

  def new
  end

  def create
    @reservation = Reservation.find_by_id(session[:reservation_id])
    rate = @reservation.listing.nightly_rate
    nights = (@reservation.check_in_date..@reservation.check_out_date).count

    nonce_from_the_client = params["payment-method-nonce"]

    result = Braintree::Transaction.sale(
      :amount => rate * nights,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
      :submit_for_settlement => true
    })

    @payment = Payment.new(total: result.transaction.amount.to_s, transaction_id: result.transaction.id, last_4: result.transaction.credit_card_details.last_4)


    if @payment.save
    @reservation.payment_id = @payment.id
    @reservation.save 
    flash[:notice] = "Payment Successful"
    redirect_to listings_path

    else
      flash[:notice] = "Payment failed."
      redirect_to new_payment_path
    end

  end

end
