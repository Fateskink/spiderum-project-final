module Api
  module V1
    module User1
      class PostsController < ApplicationController
        # before_action :set_user
        before_action :set_post, only: %i[show edit update destroy]
        before_action :logged_in_user, only: %i[create update destroy]
        before_action :correct_user, only: :destroy
        
        def index
          @posts = Post.paginate(page: params[:page], per_page: 20)
          # @posts = Post.all
          render json: {posts: @posts}, status: :ok
        end

        def show
          # +1 view when the post is loaded
          @post.update(view: @post.view + 1)
          render json: {post: @post}, status: :ok
        end

        def new
          @post = Post.new
        end

        def create
          @post = current_user.posts.build(post_params)
          # @post.taggings.tag_id = Tag.find(params[:tag_id])
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
          params.require(:post).permit(:title, :content, :image, :tag_id)
          # permit :image for post  |  :images => []
        end

        def set_post
          @post = Post.find(params[:id])
        end

        # def set_post
        #   @post = Post.with_attached_other_images.find(params[:id])
        # end

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