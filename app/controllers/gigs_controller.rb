class GigsController < ApplicationController
    before_action :set_gig, only: [:show]

    def index
        @gigs = Gigs.all
    end

    def show
    end

    def new
        @gig = Gig.new
    end

    def create
        @gig = Gig.new(gig_params)

        if @gig.save
            redirect_to @gig
        else
            render :new
        end
        
    end


    private

    def set_gig
        @gig = Gig.find(params[:id])
    end

    def gig_params
        params.require(:gig).permit(:venue_id, :time, :duration)
end