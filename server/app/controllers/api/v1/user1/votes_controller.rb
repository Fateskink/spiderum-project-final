module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :logged_in_user
        before_action :find_votetable

        def new
        end

        def create
          @votetable.update(vote: @votetable.vote + 1)
        end

        def destroy
          @votetable.update(vote: @votetable.vote - 1)
        end

      private
        def vote_params
          params(:vote).permit(:post_id, :comment_id)
        end

        def find_votetable
          if params[:comment_id]
            @votetable = Comment.find_by_id(params[:comment_id])
          elsif params[:post_id]
            @votetable = Post.find_by_id(params[:post_id])
          end
        end
      end
    end
  end
end