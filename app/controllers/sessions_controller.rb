class SessionsController < ApplicationController

    def login
    end

    def create
        user = User.find(params[:email]).try(:authenticate, paramas[:user][:password])

        if user
            session[:user_id] = user.id
            redirect_to user
        end
    end

    def destroy
    end

end