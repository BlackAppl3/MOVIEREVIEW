class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_cache_buster
    
private
    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      #Cache-Control => HTTP/1.0 && Pragma => HTTP/1.1
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 28 March 2019 00:00:00 GMT"
    end

    def current_user
       if session[:email]
        User.find(session[:email])
       end
    end

    def require_login
      unless session[:email]
        flash[:errors] = ["You must login first"]
        redirect_to root_path
      end
    end
end
