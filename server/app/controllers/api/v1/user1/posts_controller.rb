module Api
  module V1
    module User1
      class PostsController < ApplicationController
        # before_action :set_user
        before_action :set_post, only: %i[show edit update destroy]
        before_action :logged_in_user
        
        def index
          @posts = Post.paginate(page: params[:page], per_page: 20)
          render json: {posts: @posts}, status: :ok
        end

        def show
          # +1 view when the post is loaded
          @post.update(views: @post.view + 1)
          render json: {post: @post}, status: :ok
        end

        def new
          @post = Post.new
        end

        def create
          @post = Post.new(post_params)
          if @post.save
            render json: {post: @post}, status: :ok
          else
            render json: {error: "Post false"}, status: :unprocessable_entity
          end
        end

        def edit
        end

        def update
          if @post.update(post_params)
            render json: {post: @post}, status: :ok
          else
            render json: {error: "Update false"}, status: :unprocessable_entity
          end
        end

        def destroy
          if @post.destroy
            render json: {message: "Post deleted"}, status: :ok
          else
            render json: {error: "Delete false"}, status: :unprocessable_entity
          end
        end

      private
        def post_params
          params.require(:post).permit(:title, :content)
        end

        def set_post
          @post = Post.find(params[:id])
        end

        def set_user
          @user = User.find(params[:id])
        end
      end
    end
  end
end