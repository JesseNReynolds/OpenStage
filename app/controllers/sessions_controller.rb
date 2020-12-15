class SessionsController < ApplicationController

    def login
    end

    def create
        user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

        if !!user
            session[:user_id] = user.id
            redirect_to user
        else
            redirect_to '/login', notice: "Email or password is incorrect."
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

end