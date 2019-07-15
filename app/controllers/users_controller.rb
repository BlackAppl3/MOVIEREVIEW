class UsersController < ApplicationController
    def index
        @user = User.new
    end

    def create

        if verify_recaptcha
            "OK"
        else     
             flash[:errors] = ["Recaptcha verification failure"]
             redirect_to  root_path and return 
        end

        user = User.new(user_params)
        if user.save
           session[:email] = user.email
        #    flash[:errors] = ["Account successfully created"]
           redirect_to information_index_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to root_path
        end
    end

private
    def user_params
        params.require(:user).permit(:name, :email, :password).merge(ban: false)
    end

end