module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :logged_in_user
        before_action :find_votetable

        def create
          # @vote = Vote.find_by(votetable_id: params[@votetable.id], user_id: current_user.id)
          unless @votetable.voting.find_by(id: params[:id])
            current_user.upvote(@votetable)
            # @vote.update(:vote_score, @vote.vote_score+1)
            render json: { count: @vote.vote_score }, status: :ok
          else
            current_user.downvote(@votetable)
            # @vote = @votetable.votes.build(vote_params)
          end
        end

        def destroy
          if @votetable.voting.find_by(id: params[:id])
            current_user.upvote(@votetable)
            # @vote.update(:vote_score, @vote.vote_score+1)
            render json: { count: @vote.vote_score }, status: :ok
          else
            current_user.downvote(@votetable)
          # @vote = Vote.find_by(votetable_id: params[@votetable.id], user_id: current_user.id)
          # @vote = @votetable.votes.build(vote_params)
          # @vote.update(:vote_score, @vote.vote_score - 1)
          # render json: { count: @vote.vote_score }, status: :ok
          end
        end

        def voting
          @title = 'Voting'
          @vote = Vote.find(params[:id])
          @votes = @vote.voting.paginate(page: params[:page])
          render json: { votes: @votes }, status: :ok
        end

        private

        def vote_params
          params.require(:vote).permit(:user, :votetable)
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
