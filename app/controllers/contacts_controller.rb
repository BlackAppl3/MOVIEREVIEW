class ContactsController < ApplicationController
    def new
        @info = Contact.new
      end
  
      def create
        @info = Contact.new(create_param)
        if @info.save
           flash[:errors] = ["Your Query has been submitted successfully"]
        end
        redirect_to root_path
      end
  
  private
     def create_param
        params.require(:contact).permit(:comment, :email)
     end
end
