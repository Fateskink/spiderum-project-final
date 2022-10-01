module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :logged_in_user
        before_action :find_votetable

        # def create
        #   @vote = @votetable.votes.build #(vote_params)
        #   @vote.user_id = current_user.id
        #   if @vote = Vote.find_by_id(params[@vote.id])
        #     current_user.clear_vote(@vote)
        #     render json: { message: 'wtf' }, status: :unprocessable_entity
        #   elsif @vote.save
        #     render json: { vote: @vote }, status: :ok
        #   end
        # end

        # def destroy
        #   @vote = @votetable.votes.build(:vote_score)
        #   @vote.user_id = current_user.id
        #   if @vote = Vote.find(:id)
        #     current_user.clear_vote(@vote)
        #     render json: { message: 'wtf' }, status: :unprocessable_entity
        #   elsif @vote.save
        #     render json: { vote: @vote }, status: :ok
        #   end
        # end

        def create
          @vote = @votetable.vote.build
          @vote.user_id = current_user.id 
          render json: @vote
          # @vote.update(upvote: @vote.upvote = 1)
          # render json: { vote: @vote }, status: :ok if @vote.save
        end

        def clear_vote(some_vote)
          Vote.destroy(some_vote)
        end

      private

        def vote_params
          params.require(:vote).permit(:vote_score)
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
