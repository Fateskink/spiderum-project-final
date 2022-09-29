module Api
  module V1
    module User1
      class FollowingResetsController < ApplicationController
        before_action :logged_in_user

        # collection
        def index
          @following = User.find(params[:user_id]).following

          @following = paginate(@following)

          render json: { following: @following }, status: :ok
        end

        # collection
        # def update
        #   authorize User.find(params[:user_id])

        #   User.find(params[:user_id]).following = params[:following_ids]

        #   head status: 204
        # end

        # member
        # def show
        #   if User.find(params[:user_id]).following.find_by(id: params[:id])
        #     head status: 204
        #   else
        #     head status: 404
        #   end
        # end

        # member
        def create
          @user = User.find(params[:user_id])
          unless @user.following.find_by(id: params[:id])
            @user.follow(User.find(params[:id]))
            render json: { message: 'Follow' }, status: :ok
          end
        end

        # member
        def destroy
          @user = User.find(params[:user_id])
          if @user.following.find_by(id: params[:id])
            @user.unfollow(User.find(params[:id]))
            render json: { message: 'Unfollow' }, status: :ok
          end
        end
      end
    end
  end
end
