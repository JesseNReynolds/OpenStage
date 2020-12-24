class ApplicationController < ActionController::Base
    helper_method :venue_is_logged_in?, :current_venue, :current_venue_id,
     :user_is_logged_in?, :current_user_id, :current_user, :current_user_is_band_leader?,
     :current_user_leads_this_band?, :user_invites, :current_user_is_member_of?

    def home
        render '/home'
    end

    private

    def user_invites
        BandMember.where({user_id: current_user_id, status: "pending"})
    end

    def venue_is_logged_in?
        !!session[:venue_id]
    end

    def current_venue_id
        if venue_is_logged_in?
            session[:venue_id]
        end
    end

    def current_venue
        if venue_is_logged_in?
            Venue.find(session[:venue_id])
        end
    end

    def user_is_logged_in?
        !!session[:user_id]
    end

    def current_user_id
        if user_is_logged_in?
            session[:user_id]
        end
    end

    def current_user
        if user_is_logged_in?
            User.find(session[:user_id])
        end
    end

    def current_user_is_band_leader?
        if user_is_logged_in?
            !current_user.lead_bands.empty?
        end
    end
    
    def current_user_leads_this_band?
        if current_user_is_band_leader?
            current_user.lead_bands.include?(Band.find(params[:id]))
        end
    end

    def current_user_is_member_of?(band_id)
        band = Band.find(band_id)
        band.users.include?(current_user)
    end
end
