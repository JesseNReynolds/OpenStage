class GigsController < ApplicationController
    before_action :set_gig, only: [:show]

    def index
        @gigs = Gig.all
    end

    def show
    end

    def new
        if Venue.is_logged_in?(session)
            @gig = Gig.new
        else
            redirect_to gigs_path, notice: "You must be logged in as a venue to create gigs."
        end
    end

    def create
        @gig = Gig.new(gig_create_params)

        if @gig.save
            redirect_to @gig
        else
            render :new
        end

    end

    def destroy
        @gig.destroy
        redirect_to gigs_path, notice: 'Gig deleted.'
    end
    
    private

    def set_gig
        @gig = Gig.find(params[:id])
    end

    def gig_params
        params.require(:gig).permit(:time, :duration)
    end

    def gig_create_params
        params[:gig][:venue_id] = Venue.current_venue_id(session)
        params.require(:gig).permit(:time, :duration, :venue_id)
    end

end