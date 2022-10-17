module Api
  module V1
    module User1
      class ConversationsController < ApplicationController
        before_action :authorize
        before_action :set_conversation %i[show destroy]

        def index
          @pagy, @conversations = pagy(Conversation.all)
          list_conver = { conversations: @conversations, metadata: meta_data }
          render json: list_conver, status: :ok
        end

        def show
          render json: {conversation: @conversation}, status: :ok
        end

        def create
          @conversation = Conversation.build
          
        end

        def destroy
        end

        private

        def set_conversation
          @conversation = Conversation.find_by(params[:conversation_id])
        end

        def conversation_params
          params.permit(:room_name)
        end
      end
    end
  end
end