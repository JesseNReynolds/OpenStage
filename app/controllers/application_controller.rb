class ApplicationController < ActionController::Base
    helper_method :venue_is_logged_in?, :current_venue, :current_venue_id, :user_is_logged_in?, :current_user_id, :current_user

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

    def self.current_user_id(session)
        session[:user_id]
    end

    def self.current_user(session)
        User.find(session[:user_id])
    end

end
