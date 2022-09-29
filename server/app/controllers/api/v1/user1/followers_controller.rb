module Api
  module V1
    module User1
      class FollowersResetsController < ApplicationController
        before_action :logged_in_user

        # collection
        def index
          @followers = User.find(params[:user_id]).followers

          @followers = paginate(followers)

          render json: { followers: @followers }, status: :ok
        end

        # collection
        # def update
        #   authorize User.find(params[:user_id])

        #   User.find(params[:user_id]).followers = params[:follower_ids]

        #   head status: 204
        # end

        # member
        # def show
        #   if User.find(params[:user_id]).followers.find_by(id: params[:id])
        #     head status: 204
        #   else
        #     head status: 404
        #   end
        # end

        # member
        def create
          @user = User.find(params[:user_id])
          unless @user.followers.find_by(id: params[:id])
            User.find(params[:id]).follow(@user)
            render json: { message: 'Follow' }, status: :ok
          end
        end

        # member
        def destroy
          @user = User.find(params[:user_id])
          if @user.followers.find_by(id: params[:id])
            User.find(params[:id]).unfollow(@user)
            render json: { message: 'Unfollow' }, status: :ok
          end
        end
      end
    end
  end
end
