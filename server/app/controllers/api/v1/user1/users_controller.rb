module Api
  module V1
    module User1
      class UsersController < ApplicationController
        before_action :authorize, only: %i[index edit update destroy feed my_favourites search search_to_mess]
        before_action :set_user, only: %i[show edit update destroy]
        before_action :correct_user, only: %i[edit update]
        before_action :admin_user, only: :destroy
        # before_action :validate_email_update

        def index
          @pagy, @users = pagy(User.all)
          render json: { metadata: meta_data , users: @users }, status: :ok
        end

        def show
          render json: @user, status: :ok
        end

        def new
          @user = User.new
        end

        def create
          @user = User.new(user_params)
          @user.image.attach(params[:image])
          if @user.password == @user.password_confirmation
            @user.save
            SendMailJob.perform_later @user
            render json: { message: 'Please check your email to active account' }, status: :ok
          else
            render json: {message: "Password incorrect!"} , status: :unprocessable_entity
          end
        end
        # @user.errors.full_messages
        def edit
        end

        def update
          if @user.update(user_params)
            render json: { user: @user }, status: :ok
          else
            render json: @user.errors.full_messages, status: :unprocessable_entity
          end
        end

        # def update
        #   if @current_user.update_new_email!(@new_email)
        #     @user.send_update_email
        #     render json: { status: 'Email Confirmation has been sent to your new Email.' }, status: :ok
        #   else
        #     render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
        #   end
        # end

        # update | change email
        # def email_update
        #   token = params[:token].to_s
        #   @user = User.find_by(confirmation_token: token)
        #   if !@user || !@user.confirmation_token_valid?
        #     render json: {error: 'The email link seems to be invalid / expired. Try requesting for a new one.'}, status: 404
        #   else
        #     @user.update_new_email!
        #     render json: {status: 'Email updated successfully'}, status: :ok
        #   end
        # end

        # Confirm email, active account
        def confirm
          token = params[:token].to_s
          @user = User.find_by(confirmation_token: token)
          if @user.present? && @user.confirmation_sent_at + 30.days > Time.now.utc
            @user.confirmation_token = nil
            @user.confirmed_at = Time.now.utc
            @user.save
            render json: { status: 'User confirmed successfully' }, status: :ok
          else
            render json: { status: 'Invalid token' }, status: :not_found
          end
        end

        # Ban user
        def destroy
          @user.update(banned: true)
          render json: { message: 'User has been banned' }, status: :ok
        end

        def following
          @title = 'Following'
          @user = User.find(params[:id])
          @users = @user.following
          @pagy, @users = pagy(@users)
          render json: { users: @users, metadata: meta_data }, status: :ok
        end

        def followers
          @title = 'Followers'
          @user = User.find(params[:id])
          @users = @user.followers
          @pagy, @users = pagy(@users)
          render json: { users: @users, metadata: meta_data }, status: :ok
        end

        def my_favourites
          @title = 'my_favourites'
          @favourite = @current_user.favourites
          @pagy, @favourite = pagy(@favourite)
          render json: @favourite, status: :ok
        end

        def feed
          following_ids = Relationship.select(:followed_id).where('follower_id = ?', params[:id])
          @post = Post.where('user_id = ?', params[:id])
          @post_following = Post.where(user_id: following_ids)
          new_feed = @post.including(@post_following)
          new_feed.sort_by(&:"#{created_at}")
          # @pagy, @tests = pagy(new_feed)
          render json: new_feed, serializer: nil, status: :ok
        end

        def search
          @user = User.find(params[:id])
          @users = @user.all
          @q = @users.ransack(params[:q])
          @search = @q.result
          @pagy, @search = pagy(@search)
          render json: { metadata: meta_data , search: @search }, status: :ok
        end

        def search_to_mess
          @user = User.find(params[:id])
          @users = @user.following
          @q = @users.ransack(params[:q])
          @search = @q.result
          @pagy, @search = pagy(@search)
          render json: { metadata: meta_data , search: @search }, status: :ok
        end

        private

        # set user with params id
        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.permit(:name, :email, :password, :password_confirmation, :image)
        end

        # Confirms the correct user.
        def correct_user
          @user = User.find(params[:id])
          render josn: { message: 'You have no right to do this!' } unless @user == @current_user
        end

        def validate_email_update
          @new_email = params[:email].to_s.downcase

          return render json: { status: 'Email cannot be blank' }, status: :bad_request if @new_email.blank?

          if @new_email == @current_user.email
            return render json: { status: 'Current Email and New email cannot be the same' }, status: :bad_request
          end

          if User.email_used?(@new_email)
            render json: { error: 'Email is already in use.' }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
