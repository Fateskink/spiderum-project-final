module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :authorize
        before_action :find_votetable

        def upvote
          @vote = @votetable.votes.build
          @vote.user_id = @current_user.id
          @vote.update(vote_score: @vote.vote_score + 1)
          if @vote.save
            render json: { vote: @vote }, status: :ok
          else
            render json: @vote.errors.full_messages, status: :unprocessable_entity
          end
        end

        def downvote
          @vote = @votetable.votes.build
          @vote.user_id = @current_user.id
          @vote.update(vote_score: @vote.vote_score - 1)
          if @vote.save
            render json: { vote: @vote }, status: :ok
          else
            render json: @vote.errors.full_messages, status: :unprocessable_entity
          end
        end

        def destroy
          @vote = Vote.find_by(params[:vote_id])
          if @vote.destroy
            render json: { message: 'unvote' }, status: :ok
          else
            render json: @vote.errors.full_messages, status: :unprocessable_entity
          end
        end
        
        private

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
