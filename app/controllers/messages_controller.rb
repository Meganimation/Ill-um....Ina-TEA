class MessagesController < ApplicationController
  protect_from_forgery

    def index 
        @messages = Message.all
        render json: @messages, include: :sender
    end
    
    
    # def new 
    #   message = Message.new(messages_params)
    #   if Message.save
    #       render json: message, except: [:created_at, :updated_at]
    #   else 
    #       render json: { errors: message.errors } 
    #   end
    # end 
    
    
      def show
        set_message
        render json: @message = Message.find(params[:id])
      end
    
    
    
      def create
        message = Message.new(message_params)
    
        if message.save
          render json: message, status: :created
        else
          render json: message.errors, status: :unprocessable_entity
        end
      end
    
      def edit
        @message = Message.find(params[:id])
      end
    
      def update
        message = Message.find(params[:id])
          if message.update(message_params)
            render json: message
          else 
            render json: { errors: message.errors } 
          end
      end
    
      def destroy
        @message = Message.find(params[:id])
        @message.destroy
      end
    
      private
    
      def set_message
        @message = Message.find(params[:id])
      end
    
    def message_params
        params.permit(:content, :facebook_id, :sender_id, :reciever_id, :id)
    end

end
