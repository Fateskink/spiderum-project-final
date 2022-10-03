module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :logged_in_user
        before_action :find_votetable

        def create
          @vote = @votetable.votes.build
          # @vote = Vote.new
          @vote.user_id = 2
          # render json: @vote
          # @vote.update(upvote: @vote.upvote = 1)
          render json: { vote: @vote }, status: :ok if @vote.save
        end

      #   def vote_up
      #     @list = List.find(params[:list_id])
      #     @vote = Vote.find_or_create_by(list_id: params[:id], user_id: current_user.id)
      #     Vote.increment_counter(:vote_count, @vote)
      #     redirect_to list_path(@list), notice: 'Voted Up.'
      # end
  
      # def vote_down
      #     @list = List.find(params[:list_id])
      #     @vote = Vote.find_or_create_by(list_id: params[:id], user_id: current_user.id)
      #     Vote.decrement_counter(:vote_count, @vote)
      #     redirect_to list_path(@list), notice: 'Voted Down.'    
      # end

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
