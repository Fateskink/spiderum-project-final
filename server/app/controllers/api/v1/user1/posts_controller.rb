module Api
  module V1
    module User1
      class PostsController < ApplicationController
        before_action :authorize, only: %i[create update destroy]
        before_action :set_post, only: %i[show edit update destroy]
        # before_action :admin_user, only: :destroy
        before_action :correct_user, only: %i[edit update destroy]
        
        def index
          @posts = Post.paginate(page: params[:page], per_page: 20)
          render json: {posts: @posts}, status: :ok
        end

        def show
          @post.update(view: @post.view + 1)
          render json: {post: @post}, status: :ok
        end

        def new
          @post = Post.new
        end

        def create
          @tag = Tag.find(params[:tag_id])
          @post = @tag.posts.build(post_params)
          @post.user_id = @current_user.id
          @post.image.attach(params[:post][:image])
          if @post.save
            render json: {post: @post}, status: :ok
          else
            render json: @post.errors.full_messages, status: :unprocessable_entity
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
          params.require(:post).permit(:title, :content, :image, :tag)
          # permit :image for post  |  :images => []
        end

        def set_post
          @post = Post.find(params[:id])
        end

        def set_user
          @user = User.find(params[:id])
        end

        # in case of somebody try to delete another's post
        def correct_user
          @post = current_user.posts.find_by(id: params[:id])
          if @post.nil?
            render json: {message: "You have no right"}, status: :unauthorized
          end
        end

      end
    end
  end
end