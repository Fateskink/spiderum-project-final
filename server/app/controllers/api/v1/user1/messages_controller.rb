module Api
  module V1
    module User1
      class MessagesController < ApplicationController

        def create
          @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
          @message = @conversation.messages.create(message_params)
          @conversation.update(mes_count: @conversation.mes_count + 1)
          render json: @conversation, serializer: ConversationSerializer, status: :ok
        end
      
        def destroy
          @message = Message.find_by(params[:message_id])
          if @message.delete
            render json: "Deleted", status: :ok
          end
        end

        private
      
        def message_params
          params.require(:message).permit(:user_id, :mes_content)
        end
      end
    end
  end
end