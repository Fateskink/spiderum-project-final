module Api
  module V1
    module User1
      class RelationshipsController < ApplicationController
        before_action :logged_in_user

        def create
          @user =  User.find_by(id: params[:user_id])
          unless @user && @user.followers.find_by(id: params[:id])
            current_user.follow(@user)
            render json: { message: 'Follow' }, status: :ok
          end
        end

        def destroy
          @user =  User.find_by(id: params[:user_id])
          # if @user && @user = Relationship.find_by(followed_id: params[:user_id])
          if @user && @user.followers.find_by(id: params[:id])
            current_user.unfollow(@user)
            render json: { message: 'Unfollow' }, status: :ok
          end
        end

                # def destroy
        #   @user = Relationship.find_by_id(id: params[:followed_id])
        #   current_user.unfollow(@user)
        #   render json: { message: 'Unfollow' }, status: :ok
        #   # @relationship = current_user.active_relationships.find_by(followed_id: @user.id)
        #   # if @relationship.valid?
        #   #   @relationship.destroy
        #   #   render json: { message: 'Unfollow' }, status: :ok
        #   # end
        # end
      end
    end
  end
end
