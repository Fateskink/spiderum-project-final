module Api
  module V1
    module User1
      class VotesController < ApplicationController
        before_action :logged_in_user
        before_action :find_votetable

        def create
          @vote = @votetable.votes.build(vote_params)
          @vote.user_id = current_user.id
          if @vote = Vote.find_by_id(params[@vote.id])
            current_user.clear_vote(@vote)
            render json: { message: 'wtf' }, status: :unprocessable_entity
          elsif @vote.save
            render json: { vote: @vote }, status: :ok
          end

        end

        # def create
        #   @comment = @commentable.comments.build(comment_params)
        #   @comment.user_id = current_user.id
        #   if @comment.save
        #     render json: {comment: @comment}, status: :ok
        #   else
        #     render json: @comment.errors.full_messages, status: :unprocessable_entity
        #   end
        # end

        # unless @votetable.voting.find_by(id: params[:id])
        #   current_user.upvote(@votetable)
        #   render json: { count: @vote.vote_score }, status: :ok
        # else
        #   current_user.downvote(@votetable)
        # end

        # @list = List.find(params[:list_id])
        # @vote = Vote.find_or_create_by(list_id: params[:id], user_id: current_user.id)
        # Vote.increment_counter(:vote_count, @vote)
        # redirect_to list_path(@list), notice: 'Voted Up.'

        # @vote = Vote.find_by(votetable_id: params[@votetable.id], user_id: current_user.id)
        # @vote.update(:vote_score, @vote.vote_score+1)
        # @vote = @votetable.votes.build(vote_params)

        def destroy
          @vote = @votetable.votes.build(:vote_score)
          @vote.user_id = current_user.id
          if @vote = Vote.find(:id)
            current_user.clear_vote(@vote)
            render json: { message: 'wtf' }, status: :unprocessable_entity
          elsif @vote.save
            render json: { vote: @vote }, status: :ok
          end
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
