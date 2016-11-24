class ListingsController < ApplicationController

  def index
    @listings = Listing.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    if current_user.tenant?
      flash[:notice] = "Sorry. Tenants are not allowed to add listings"
      return redirect_to listings_path, notice: "Sorry. Tenants are not allowed to add listings"
    else render 'new'
    end
  end

  def edit
      @listing = Listing.find(params[:id])
      if current_user.tenant?
        flash[:notice] = ""
        return redirect_to listings_path, notice: "Sorry. Tenants are not allowed to edit listings"
      elsif (current_user.landlord?) && (@listing.user != current_user)
        flash[:notice] = ""
        return redirect_to listings_path, notice: "Sorry. Landlords can only edit their own listings"
      else render 'edit'
      end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      redirect_to @listing
    else
        render 'new'
      end
    end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update!(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def destroy
   @listing = Listing.find(params[:id])
    if current_user.tenant?
     flash[:notice] = ""
     return redirect_to listings_path, notice: "Sorry. Tenants are not allowed to delete listings"
   elsif (current_user.landlord?) && (@listing.user != current_user)
     flash[:notice] = ""
     return redirect_to listings_path, notice: "Sorry. Landlords can only delete their own listings"
    else @listing.destroy
     redirect_to listings_path
    end
  end

  private
  def listing_params
    params.require(:listing).permit(:address, :user_id, :nightly_rate, :no_bedrooms, :no_bathrooms, :city, :availale, :description, :state)
  end

end
