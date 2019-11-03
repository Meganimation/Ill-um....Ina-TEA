class SendersController < ApplicationController
  protect_from_forgery

    def index 
        senders = Sender.all
        render json: senders, except: [:created_at, :updated_at], include: :messages
    end
    
    
    
    
    def new 
      sender = Sender.new(sender_params)




      if Sender.save
          render json: sender, except: [:created_at, :updated_at]
      else 
          render json: { errors: sender.errors } 
      end
    end 
    
    
      def show
        render json: @sender = Sender.find(params[:id]), include: :messages
      end
    
    
    
      def create
        sender = Sender.new(sender_params)
    
        if sender.save
          render json: sender, status: :created
        else
          render json: sender.errors, status: :unprocessable_entity
        end
      end
    
      def edit
        @sender = Sender.find(params[:id])
      end
    
      def update
        sender = Sender.find(params[:id])
          if sender.update(sender_params)
            render json: sender
          else 
            render json: { errors: sender.errors } 
          end
      end
    
      def destroy
        @sender = Sender.find(params[:id])
        @sender.destroy
      end
    
      private
    
      def set_sender
        @sender = Sender.find(params[:id])
      end
    
    def sender_params
        params.permit(:name, :email, :facebook_id)
    end

end
