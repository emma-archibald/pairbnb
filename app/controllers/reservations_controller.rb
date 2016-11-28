class ReservationsController < ApplicationController

  def index
    path = request.path.to_s
    if path.include? "users"
      @user = current_user
      @all_reservations = @user.reservations.all
    else
      @listing = Listing.find_by(params[:id])
      @all_reservations = @listing.reservations.all
    end

  end

  def show
    @user = current_user
    @user_reservations = @user.reservations.all
    # if listing_id
    #   render 'listing_reservations_show page'
    # else
    #   render
    # end
    #
    # end
  end

  def new
    @user = current_user
    @reservation = Reservation.new(:user_id=>@user.id)
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id



    if @reservation.save
      flash[:success] = "Reservation Successfully Created"
      redirect_to listings_path
    end
  end

  def destroy
     reservation_id = params[]
     @reservation = Reservation.find(reservation_id)
     @reservation.destroy
     redirect_to reservation_path(current_user)
   end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :check_in_date, :check_out_date)
    end

end
