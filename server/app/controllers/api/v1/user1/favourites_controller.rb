module Api
  module V1
    module User1
      class FavouritesController < ApplicationController
        before_action :authorize
        before_action :set_post, only: %i[create index]

        def index
          @pagy, @favourites = pagy(@post.favourites)
          render json: { favourites: @favourites, metadata: meta_data }, status: :ok
        end

        def create
          @favourite = @post.favourites.build
          @favourite.user_id = @current_user.id
          if @favourite.save
            @post.update(favourite_count: @post.favourite_count + 1)
            render json: { favourite: @favourite }, status: :ok
          else
            render json: { message: 'Error' }, status: :unprocessable_entity
          end
        end

        def destroy
          if @favourite = Favourite.find_by(params[:favourite_id])
            @favourite.destroy
            render json: { message: 'Not favourite any more' }, status: :ok
          end
        end

        def my_favourites
          @title = 'my_favourites'
          @user = User.find(params[:user_id])
          @favourite_posts = @user.favourites
          @pagy, @favourite_posts = pagy(@favourite_posts)
          render json: @favourite_posts
        end

        private

        def set_post
          @post = Post.find_by_id(params[:post_id])
        end
      end
    end
  end
end
