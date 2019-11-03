class RecieversController < ApplicationController
  protect_from_forgery

    def index 
        recievers = Reciever.all
         render json:recievers, except: [:created_at, :updated_at], include: :messages
     end
     
     
     
     
     def new 
       reciever = Reciever.new(reciever_params)
       if Reciever.save
           render json: reciever, except: [:created_at, :updated_at]
       else 
           render json: { errors: reciever.errors } 
       end
     end 
     
     
       def show
         render json: @reciever = Reciever.find(params[:id])
       end
     
     
     
       def create
         reciever = Reciever.new(reciever_params)
     
         if reciever.save
           render json: reciever, status: :created
         else
           render json: reciever.errors, status: :unprocessable_entity
         end
       end
     
       def edit
         @reciever = Reciever.find(params[:id])
       end
     
       def update
         reciever = Reciever.find(params[:id])
           if reciever.update(reciever_params)
             render json: reciever
           else 
             render json: { errors: reciever.errors } 
           end
       end
     
       def destroy
         @reciever = Reciever.find(params[:id])
         @reciever.destroy
       end
     
       private
     
       def set_reciever
         @reciever = Reciever.find(params[:id])
       end
     
     def reciever_params
        params.permit(:name, :email, :facebook_id)
     end

end
