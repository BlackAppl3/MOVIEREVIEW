class ContactsController < ApplicationController
    def new
        @info = Contact.new
        @user_info = User.new
      end
  
      def create
        @info = Contact.new(create_param)
        if @info.save
           flash[:errors] = ["Your Query has been submitted successfully"]
        end
        redirect_to root_path
      end

      def request_result
         obj = User.find_by(email: params[:user][:email])
         
         if obj == nil 
            render plain: "You are not an user"
         else
            obj1 = Contact.find_by(email: params[:user][:email])
            if obj1 == nil 
                 render plain: "You didn't make any request!!!"
            else   
               if obj.ban == true
                 render plain: "Your request is pending!!!"
               else 
                  render plain: "Your request Approved!!!"
               end            
            end   
         end
      end   
  
  private
     def create_param
        params.require(:contact).permit(:comment, :email)
     end
end
