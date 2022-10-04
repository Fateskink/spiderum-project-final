module Api
  module V1
    module User1
      class CommentsController < ApplicationController
        before_action :find_commentable
        before_action :authorize
        before_action :correct_user, only: %i[edit update destroy]
        before_action :admin?, only: :destroy

        def new
          @comment = Comment.new
        end

        def create
          @comment = @commentable.comments.build(comment_params)
          @comment.user_id = @current_user.id
          if @comment.save
            render json: { comment: @comment }, status: :ok
          else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
          end
        end

        def destroy
          @comment = Comment.find(params[:id])
          if @comment.destroy
            render json: { message: 'Comment deleted' }, status: :ok
          else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
          end
        end

        def edit; end

        def update
          @comment = Comment.find(params[:id])
          if @comment.update(comment_params)
            render json: { comment: @comment }, status: :ok
          else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
          end
        end

        respond_to do |format|
          if @comment.save
            @notification = create_notification @comment
            render josn: { notification: @notification }, status: :ok
          else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
          end
        end

        def create_notification(comment)
          return if comment.commentable.user_id == current_user.id

          comment.commentable.notifications.build
          comment.notified_by_id = comment.user_id
        end

        private

        def comment_params
          params.require(:comment).permit(:body)
        end

        def find_commentable
          if params[:comment_id]
            @commentable = Comment.find_by_id(params[:comment_id])
          elsif params[:post_id]
            @commentable = Post.find_by_id(params[:post_id])
          end
        end

        # in case of somebody try to delete another's comment
        def correct_user
          @comment = current_user.comments.find_by(id: params[:id])
          if @comment.nil?
            render json: { message: @comment.errors.full_messages, message: 'You have no right' }, status: :unauthorized
          end
        end
      end
    end
  end
end
