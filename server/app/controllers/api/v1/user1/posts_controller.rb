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
          feed = { posts: @posts, metadata: meta_data }
          render json: feed, status: :ok
          # feed[:serializer] = PostSerializer.new(@post)
          # feed = { posts: @posts, metadata: meta_data }
          # alo[:serializer] = PostSerializer.new(@post)
          # # render json:{product_att: @product_att, message: " manh BD", serializer: PrAttributeSerializer} , each_serializer: PrAttributeSerializer
          # render json: feed
        end

        def show
          @post.update(view: @post.view + 1)
          render json: @post, status: :ok
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
            render json: { post: @post }, status: :ok
          else
            render json: @post.errors.full_messages, status: :unprocessable_entity
          end
        end

        def edit; end

        def update
          if @post.update(post_params)
            render json: { post: @post }, status: :ok
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
          render json: { search: @search, metadata: meta_data }, status: :ok
        end

        def feed
          if !@user.authorize
            index
          else
            users.feed
            # following_ids = "SELECT followed_id FROM relationships
            # WHERE follower_id = :user_id"
            # render json: 
            # Post.where("user_id IN (#{following_ids})
            # OR user_id = :user_id", user_id: :id)
            #             @posts = Post.where('user_id = ?', params[:user_id] )
            # render json: @posts, status: :ok
          end
        end

        def top
          @top = Post.where('posts.month' => Time.current.month)
                     .order(favourite_count: :desc)
                     .limit(10)
          render json: @top, status: :ok
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
