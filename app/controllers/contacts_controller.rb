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
            if obj1.nil? 
                 render plain: "You didn't make any request!!!"
            else   
               if obj.ban
                 render plain: "Your request is pending!!!"
               else 
                  render plain: "Your request Approved!!!"
               end            
            end   
         end
      end   

      def comment  
         @comment = Comment.new         
         @comments = Comment.all
         if params.has_key?(:post_comment)
            @comment = Comment.new(post_comment)
            if @comment.save 
               flash[:notice] = ["Your Comment has been submitted successfully"]
            end
            redirect_to action: "comment"
         end
      end

      def add_like
         like = Comment.find_by_id(params[:id])
         if like.likes.nil? 
            like.likes = 1
         else      
            like.likes += 1   
         end
         like.save!
         redirect_to "/contacts/comment"
      end
  
  private
     def create_param
        params.require(:contact).permit(:comment, :email)
     end
     def post_comment
        params.require(:comment).permit(:comment)
     end
end
