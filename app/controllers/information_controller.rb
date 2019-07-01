class InformationController < ApplicationController

    attr_accessor :result

    before_action :require_login

    def index
        @info = Information.where(email: session[:email])
    end

    def new
        @info = Information.new
        @temp = Movieinfo.all
        @new_arr = {}
        count = 1
        @temp.each do |val|
            @new_arr.store(count, val.moviename)
            count += 1
        end
    end

    def create
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
        @info = Information.all
    end

    def movie_info
        @info = Information.where(movieno: params[:id])
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

private    
    def information_params
        params.require(:information).permit(:movieno, :comment, :rating).merge(email: session[:email])
    end

    def information_update_params
        params.require(:information).permit(:comment, :rating)
    end
end