class InformationController < ApplicationController

    attr_accessor :result

    before_action :require_login
    before_action :root_login, only: [:root]

    def index
        @info = Information.where(email: session[:email])
        @id = Information.find_by(email: session[:email])
        @name = User.find_by(email: session[:email]).name
        @warning_count = User.find_by(email: session[:email]).warning_count
    end

    def new
        @info = Information.new
        @temp = Movieinfo.all
        @new_arr = {}
        count = 1
        @temp.each do |val|
            @new_arr.store(val.id, val.moviename)
            count += 1
        end
    end

    def create
        
        if verify_recaptcha
            "OK"
        else     
             flash[:errors] = ["Recaptcha verification failure"]
             redirect_to  new_information_path and return 
        end

        @containval = Information.find_by(email: session[:email], movieno: params[:movieno])

        if @containval
            #fail
            @containval.update(comment: params[:information][:comment])
            @containval.update(rating: params[:information][:rating])
            redirect_to information_index_path and return
        end

        @info = Information.new(information_params)
        if @info.save
              redirect_to information_index_path
         else
              flash[:errors] = @info.errors.full_messages
              redirect_to '/information/new'
         end
    end

    def edit
        @info = Information.find(params[:id])
    end

    def update
        @info = Information.find(params[:id])
        if @info.update(information_update_params)
            redirect_to information_index_path
        else
            flash[:errors] = @info.errors.full_messages
            redirect_to '/information/index'
        end
    end

    def destroy
        @temp = Information.find(params[:id])
        @temp.destroy
        redirect_to information_index_path
    end

    def root
        # unless session[:email] == "root@gmail.com"
        #     flash[:errors] = ["You don't have permission to enter Root :)"]
        #     redirect_to root_path
        # end
        @info = Information.all
        @total = Contact.all.count
        @movieinfo = Movieinfo.all
        @obj1 = Movieinfo.new
        @mov_obj = Movieinfo.new
    end

    def movie_info
        @info = Information.where(movieno: params[:id])
        @res = Information.where(movieno: params[:id])

        if params[:order] && params[:order] == "high"
            @res =  @res.order({rating: :desc})
        elsif params[:order] && params[:order] == "low"
             #fail
            @res =  @res.order({rating: :asc})
        end

        rate = 0 
        users = 0
        @info.each do |val|
            if val.rating !=nil
               rate += val.rating
               users += 1
            end 
        end 
        
        if users == 0
            @result = 0
         else
            @result = (rate.to_f)/(users.to_f)
            @result = @result.round(2)
         end      
    end

    def ban_user
        @temp_user = User.find_by(email: params[:email])
        if @temp_user
            @dem = Information.find(params[:info_id])
            obj = BanInfo.new
            obj.users_id = @temp_user.id
            obj.moviename = Movieinfo.find(@dem.movieno).moviename 
            obj.comment = @dem.comment 
            obj.rating = @dem.rating
            byebug
            @temp_user.update(ban: true)
            obj.save
        end    
        # redirect_to 'information/root'
    end

    def warn_user
       @temp_user = User.find_by(email: params[:email])
       if @temp_user
           if @temp_user.warning_count == nil
               val = 1
           else
               val = @temp_user.warning_count+1
           end
           @temp_user.update(warning_count: val)
           if val >= 3
              @temp_user.update(ban: true)
           end
       end
    end

    def show_requests
        @queries = Contact.all
    end

    def unban_user
        val = params[:email]+".com"
        obj = User.find_by(email: val)
        if obj
           obj.update(ban: false)
        end
        redirect_to information_show_requests_path
    end

    def history
        val = params[:email]+".com"
        begin
            obj_val = User.find_by(email: val).id
            @obj = BanInfo.where(users_id: obj_val)
            @total = BanInfo.where(users_id: obj_val).count 
        rescue => exception
            @total = 0
        else
            
        end
    end

    def addmovie
        dup_val = Movieinfo.all
        dup_val.each do |val|
            if val.moviename == params[:movieinfo][:moviename]
                redirect_to "/information/root" and return
            end    
        end
        #fail
        # Movieinfo.create(moviename: params[:movieinfo][:moviename])
        obj = Movieinfo.new(set_movieinfo_params)
        if obj.save
            redirect_to "/information/root"
        else 
            render plain: "Sorry"    
        end    
    end

    def delete_movie
        obj = Movieinfo.find(params[:id])
        obj.destroy
        redirect_to "/information/root"
    end

    def edit_movie
        obj = Movieinfo.find(params[:id])
        obj.update(moviename: params[:movieinfo][:moviename])
        redirect_to "/information/root"
    end

private    
    def set_movieinfo_params
        params.require(:movieinfo).permit(:moviename, :image)
    end

    def information_params
        params.require(:information).permit(:comment, :rating).merge(email: session[:email]).merge(movieno: params[:movieno])
    end

    def information_update_params
        params.require(:information).permit(:movieno, :comment, :rating)
    end
end