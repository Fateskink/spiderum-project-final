module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :logged_in_user
        before_action :find_votetable

        # def upvote
        #   # unless @user && @user.followers.find_by(id: params[:id])
        #   unless current_user.votetable.find_by(id: params[:id])
        #     @votetable.votes.update(vote: @votetable.vote = 1)
        #   else
        #     @votetable.votes.delete
        #   end
        # end

        def upvote
          @vote = Vote.find_or_create_by(votetable_id: params[@votetable.id], user_id: current_user.id)
          Vote.increment_counter(:vote_count, @vote.id)
          render json: {count: @vote.vote_count}, status: :ok
        end

        def downvote
          @vote = Vote.find_or_create_by(votetable_id: params[@votetable.id], user_id: current_user.id)
          Vote.decrement_counter(:vote_count, @vote.id)
          render json: {count: @vote.vote_count}, status: :ok
        end

        private

        def vote_params
          params.require(:vote).permit(:user)
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
