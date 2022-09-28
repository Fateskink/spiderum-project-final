module Api
  module V1
    module User1
      class PasswordResetsController < ApplicationController
        before_action :find_commentable, only: :create
        before_action :logged_in_user
        before_action :correct_user, only: :destroy

        def new
          @comment = Comment.new
        end

        def create
          @commentable.comments.build(comment_params)
          @commentable.save
        end

        def destroy
          @commentable.comments.destroy
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
            render json: {message: "You have no right"}, status: :unauthorized
          end
        end
      end
    end
  end
end
