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

  def edit
      @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing
    else
        render 'new'
      end
    end

    def update
    @listing = Listing.find(params[:id])

    if @listing.update(article_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def destroy
   @listing = Listing.find(params[:id])
   @listing.destroy

   redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:address, :user_id, :nightly_rate, :no_bedrooms, :no_bathrooms, :city, :availale, :description, :state)
  end

end
