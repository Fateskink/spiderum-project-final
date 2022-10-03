module Api
  module V1
    module User1
      class FavouritesController < ApplicationController
        before_action :logged_in_user
        before_action :set_post, only: :create

        def index
          @favourites = Favourite.paginate(page: params[:page], per_page: 20)
          render json: { favourites: @favourites }, status: :ok
        end

        def create
          @favourite = @post.favourites.build
          @favourite.user_id = current_user.id
          if @favourite.save
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

        def ranking
          time_range = (Time.now.midnight - 1.month)..Time.now.midnight
          @posts = Post.joins(:favourite)
                       .select('favourites.*, COUNT(posts.id) as ranking')
                       .group('favourites.id')
                       .where('posts.created_at' => time_range)
                       .order('ranking DESC')
                       .limit(10)
          render json: @posts, status: :ok
        end

        private

        def set_post
          @post = Post.find_by_id(params[:post_id])
        end
      end
    end
  end
end
