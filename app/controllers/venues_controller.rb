class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  def index
    byebug
    @venues = Venue.all
  end

  # GET /venues/1
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit

    if @venue.id == current_venue.id
    else
      redirect_to venues_path notice: "You must be logged in to edit your info page."
    end
    
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      session[:venue_id] = @venue.id
      redirect_to @venue, notice: 'Venue was successfully created.'
    else
      render :new 
    end

  end

  # PATCH/PUT /venues/1
  def update

      if @venue.update(venue_params)
        redirect_to @venue, notice: 'Venue was successfully updated.'
      else
        render :edit 
      end

  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :email, :address, :city, :state, :password, :password_confirmation)
    end

end
