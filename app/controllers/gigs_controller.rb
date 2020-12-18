class GigsController < ApplicationController
    before_action :set_gig, only: [:show, :destroy]

    def available
        @gigs = Gig.all_available
    end
    
    def index
        @gigs = Gig.all
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