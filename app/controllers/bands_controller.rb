class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def invite_member
    user = User.find(params[:user_id])
    if BandMember.create(user_id: params[:user_id], band_id: params[:band_id], status: "pending")
      redirect_to user, notice: "Invite sent."
    else
      redirect_to user, notice: "Something went wrong, please try again later."
    end
  end

  def claim_gig
    gig = Gig.find(params[:gig_id])
    band = Band.find(params[:band_id])
    gig.band_id = band.id
    gig.status = "Pending"
      if gig.save
        redirect_to band, notice: "Gig requested."
      else
        redirect_to gig, notice: "Something went wrong, please try again later."
      end
  end

  # GET /bands
  def index
    @bands = Band.all
  end

  # GET /bands/1
  def show
  end

  # GET /bands/new
  def new
    if User.is_logged_in?(session)
      @band = Band.new
    else
      redirect_to bands_path, notice: "You must be logged in as a user to create a band."
    end
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands
  def create
    @band = Band.new(band_params)
    @band.leader_id = User.current_user_id(session)

    if @band.save
      redirect_to @band, notice: 'Band was successfully created.' 
    else
      render :new 
    end

  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      redirect_to @band, notice: 'Band was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
    redirect_to bands_url, notice: 'Band was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:name, :bio)
    end
end
