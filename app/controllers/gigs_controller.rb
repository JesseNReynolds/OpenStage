class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :destroy, :accept, :decline]

    def available
        @gigs = Gig.all_available
        @header = "Available Gigs"
        render :index
    end
    
    def index
        if params[:venue_id]
            venue = Venue.find(params[:venue_id])
            @gigs = venue_future_gigs(params[:venue_id])
            @header = "Upcoming gigs at #{venue.name}"
        elsif params[:band_id]
            band = Band.find(params[:band_id])
            @gigs = band.gigs
            @header = "#{band.name.possessive} gigs"
        elsif params[:user_id]
            user = User.find(params[:user_id])
            @gigs = user.gigs
            @header = "#{user.name.possessive} gigs"
        else
            @header = "Gigs"
            @gigs = Gig.all
        end
    end

    def claim_gig
        gig = Gig.find(params[:gig_id])
        band = Band.find(params[:band_id])
        gig.band_id = band.id
        gig.approval = "Pending"
        if gig.save
            redirect_to gig, notice: "Gig requested."
        else
            redirect_to gig, notice: "Something went wrong, please try again later."
        end
    end

    def accept
        @gig.approval = "Approved"
        if @gig.save
            redirect_to venue_gigs_path(current_venue), notice: "Gig approved"
        else
            redirect_to venue_gigs_path(current_venue), notice: "Something went wrong. Please try again later."
        end
    end

    def decline
        @gig.approval = nil
        @gig.band_id = nil
        if @gig.save
            redirect_to venue_gigs_path(current_venue), notice: "Gig denied. Gig status set to available. To remove the gig posting, delete this gig."
        else
            redirect_to venue_gigs_path(current_venue), notice: "Something went wrong. Please try again later."
        end
    end

    def show
    end

    def new
        if venue_is_logged_in?
            @gig = Gig.new
        else
            redirect_to gigs_path, notice: "You must be logged in as a venue to create gigs."
        end
    end

    def create
        @gig = Gig.new(gig_params)
        @gig.venue_id = current_venue_id
        if @gig.save
            redirect_to @gig
        else
            render :new
        end

    end

    def destroy
        # Should I check here for login status so bad actors cannot circumvent the check in view?
        @gig.destroy
        redirect_to gigs_path, notice: 'Gig deleted.'
    end
    
    private

    def set_gig
        @gig = Gig.find(params[:id])
    end

    def gig_params
        params.require(:gig).permit(:time, :duration, :venue_message)
    end

end