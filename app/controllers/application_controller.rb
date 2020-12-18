class ApplicationController < ActionController::Base
    helper_method :venue_is_logged_in?, :current_venue, :current_venue_id,
     :user_is_logged_in?, :current_user_id, :current_user, :current_user_is_leader?

    def home
        render '/home'
    end

    private

    def venue_is_logged_in?
        !!session[:venue_id]
    end

    def current_venue_id
        session[:venue_id]
    end

    def current_venue
        Venue.find(session[:venue_id])
    end

    def user_is_logged_in?
        !!session[:user_id]
    end

    def current_user_id
        session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def current_user_is_leader?
        !current_user.lead_bands.empty?
    end
        
end
