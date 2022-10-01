module Api
  module V1
    module User1
      class FavouritesController < ApplicationController
        before_action :logged_in_user
        before_action :set_post, only: :create
        before_action :set_favourite, only: :create

        def index
          @favourites = Favourite.paginate(page: params[:page], per_page: 20)
          render json: { favourites: @favourites }, status: :ok
        end

        def create
          if @favourite = Favourite.find_by(params[:favourite_id])
            @favourite.destroy
            render json: { message: 'Not favourite any more' }, status: :ok
          else
            @favourite = @post.favourite.build
            @favourite.user_id = current_user.id
            if @favourite.save
              render json: { favourite: @favourite }, status: :ok
            else
              render json: { message: 'Error' }, status: :unprocessable_entity
            end
          end
        end

        private

          def set_post
            @post = Post.find_by_id(params[:post_id])
          end

          def set_favourite
            @favourite = Favourite.find_by_id(params[:favourite_id])
          end
      end
    end
  end
end
