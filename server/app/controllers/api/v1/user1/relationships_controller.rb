module Api
  module V1
    module User1
      class RelationshipsController < ApplicationController
        before_action :logged_in_user

        def create
          @user = User.find(params[:followed_id])
          current_user.follow(@user)

          # current_user.active_relationships.build(follower_id: @current_user.id,followed_id: @user.id)
          render json: { message: 'Follow' }, status: :ok
        end

        # def create
        #   @user = User.find(params[:followed_id])
        #   current_user.follow(@user)
        #   respond_to do |format|
        #     format.html { redirect_to @user }
        #     format.js
        #   end
        # end
      
        # def destroy
        #   @user = Relationship.find(params[:id]).followed
        #   
        #   respond_to do |format|
        #     format.html { redirect_to @user }
        #     format.js
        #   end
        # end

        def destroy
          @user = Relationship.find(params[:id]).followed
          current_user.unfollow(@user)
          render json: { message: 'Unfollow' }, status: :ok
          # @relationship = current_user.active_relationships.find_by(followed_id: @user.id)
          # if @relationship.valid?
          #   @relationship.destroy
          #   render json: { message: 'Unfollow' }, status: :ok
          # end
        end

      end
    end
  end
end
