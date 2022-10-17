module Api
  module V1
    module User1
      class ConversationsController < ApplicationController
        before_action :authorize
        before_action :set_conversation % i[show destroy]

        def index
          @pagy, @conversations = pagy(Conversation.all)
          list_conver = { conversations: @conversations, metadata: meta_data }
          render json: list_conver, status: :ok
        end

        def show
          render json: { conversation: @conversation }, status: :ok
        end

        def create
          @conversation = Conversation.get(current_user.id, params[:user_id])
          add_to_conversations unless conversated?
          if @conversation.save
            render json: @conversation, status: :ok
          else
            render json: @conversation.errors.full_messages, status: :unprocessable_entity
          end
        end

        def destroy
          render json: 'Conversation deleted', status: :ok if @conversation.delete
        end

        private

        def set_conversation
          @conversation = Conversation.find_by(params[:conversation_id])
        end

        def conversation_params
          params.permit(:room_name)
        end

        def add_to_conversations
          @conversations ||= []
          @conversations << @conversation.id
        end

        def conversated?
          @conversations.include?(@conversation.id)
        end
      end
    end
  end
end
