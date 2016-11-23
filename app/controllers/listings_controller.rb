class ListingsController < ActionController::Base

  def index
    # @listings = Listing.all
    @listings = Listing.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @listing = Listing.find(params[:id])
end


  def new
      @listing = Listing.new
  end





end
