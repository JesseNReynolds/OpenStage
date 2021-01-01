class SessionsController < ApplicationController

    def facebook_create
        @user = User.find_or_create_by(email: auth['email']) do |u|
            u.name = auth['name']
            u.uid = auth['uid']
            u.password = SecureRandom.urlsafe_base64
        end
        session[:user_id] = @user.id
        redirect_to @user
    end

    def login
    end

    def venue_login
    end

    def create
        user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

        if !!user
            session[:venue_id] = nil
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to '/login', notice: "Email or password is incorrect."
        end
    end

    def venue_create
        venue = Venue.find_by(email: params[:email]).try(:authenticate, params[:password])

        if !!venue
            session[:user_id] = nil
            session[:venue_id] = venue.id
            redirect_to venue
        else
            redirect_to '/venues/login', notice: "Email or password is incorrect."
        end
    end

    def destroy
        session[:user_id] = nil
        session[:venue_id] = nil
        redirect_to '/'
    end

    private

    def auth
      request.env['omniauth.auth']['info'].to_h
    end
end