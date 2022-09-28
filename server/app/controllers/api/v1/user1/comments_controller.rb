module Api
  module V1
    module User1
      class PasswordResetsController < ApplicationController
        before_action :find_commentable, only: :create
        before_action :logged_in_user
        before_action :correct_user, only: :destroy
        before_action :admin?, only: :destroy

        def new
          @comment = Comment.new
        end

        def create
          @comment_content.comments.build(comment_params)
          if @comment_content.save
            render json: {commentable: @commentable}, status: :ok
          else
            render json: @commentable.errors.full_messages, status: :unprocessable_entity
          end
        end

        def destroy
          if @comment_content.comments.destroy
            render json: {message: "Comment deleted"}, status: :ok
          else
            render json: @commentable.errors.full_messages, status: :unprocessable_entity
          end
        end

        private

        def comment_params
          params.require(:comment).permit(:comment_body)
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
            render json: {message: @comment.errors.full_messages , message: "You have no right"}, status: :unauthorized
          end
        end
      end
    end
  end
end
