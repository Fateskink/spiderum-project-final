module Api
  module V1
    module User1
      class PostsController < ApplicationController
        before_action :authorize, only: %i[create update destroy]
        before_action :set_post, only: %i[show edit update destroy]
        # before_action :admin_user, only: :destroy
        before_action :correct_user, only: %i[edit update destroy]

        def index
          @pagy, @posts = pagy(Post.all)
          feed = { metadata: meta_data, posts: @posts }
          # feed[:serializer] = PostLiteSerializer.new(@post)
          # render json: feed, status: :ok
          render({ json: feed, adapter: :json, serializer: ::Post::PostLiteSerializer })
        end

        def show
          @post.update(view: @post.view + 1)
          render json: @post, serializer: ::Post::PostSerializer, status: :ok
          ::Api::V1::User1::ApplicationController::CommentsController.index
        end

        def new
          @post = Post.new
        end

        def create
          @tag = Tag.find(params[:tag_id])
          @post = @tag.posts.build(post_params)
          @post.user_id = @current_user.id
          @post.month = Time.current.month
          @post.year = Time.current.year
          @post.image.attach(params[:image])
          if @post.save
            render json: @post, serializer: ::Post::PostSerializer, status: :ok
          else
            render json: @post.errors.full_messages, status: :unprocessable_entity
          end
        end

        def edit; end

        def update
          if @post.update(post_params)
            render json: @post, serializer: ::Post::PostSerializer, status: :ok
          else
            render json: { error: 'Update false' }, status: :unprocessable_entity
          end
        end

        def destroy
          if @post.destroy
            render json: { message: 'Post deleted' }, status: :ok
          else
            render json: { error: 'Delete false' }, status: :unprocessable_entity
          end
        end

        def search
          @q = Post.ransack(params[:q])
          @search = @q.result
          @pagy, @search = pagy(@search)
          feed = { metadata: meta_data, posts: @search }
          render({ json: feed, adapter: :json, serializer: ::Post::PostLiteSerializer })
        end

        def top
          @top = Post.where('posts.month' => Time.current.month)
                     .order(favourite_count: :desc)
                     .limit(10)
          render json: @top, serializer: ::Post::PostLiteSerializer, status: :ok
        end

        private

        def post_params
          params.permit(:title, :content, :tag, :image)
          # permit :image for post  |  images: []
        end

        def set_post
          @post = Post.find(params[:id])
        end

        def set_user
          @user = User.find(params[:id])
        end

        # in case of somebody try to delete another's post
        def correct_user
          @post = @current_user.posts.find_by(id: params[:id])
          render json: { message: 'You have no right' }, status: :unauthorized if @post.nil?
        end
      end
    end
  end
end
