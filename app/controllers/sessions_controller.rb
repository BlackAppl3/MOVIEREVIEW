class SessionsController < ApplicationController
    def create
        # fail
        user = User.find_by(email: params[:email])
        
        if user && user.password == params[:password] && user.ban == true
            #fail
            flash[:errors] = ["You have been banned. Because you violated the comment policy. Contact Admin"]
            redirect_to root_path
        elsif user && user.password == params[:password] && user.password != "root"
            session[:email] = user.email 
            redirect_to information_index_path
        elsif user && user.password == params[:password] && params[:email] == "root@gmail.com"
            session[:email] = user.email
            redirect_to '/information/root'
        else 
            flash[:errors] = ["Invalid Combination", "Try back later!!!"]
            redirect_back fallback_location: users_path
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

end