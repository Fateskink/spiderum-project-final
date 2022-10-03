module Api
  module V1
    module User1
      class UsersController < ApplicationController
        before_action :set_user, only: %i[show edit update destroy]
        before_action :logged_in_user, only: %i[index edit update destroy]
        before_action :correct_user, only: %i[edit update]
        before_action :admin_user, only: :destroy

        def index
          @users = User.paginate(page: params[:page], per_page: 20)
          render json: { users: @users }, status: :ok
        end

        def show
          token = JsonWebToken.encode({ user_id: @user.id })
          render json: { user: @user , token: token}, status: :ok
        end

        def new
          @user = User.new
        end

        def create
          @user = User.new(user_params)
          @user.image.attach(params[:user][:image])
          if @user.save
            @user.send_activation_email
            render json: { message: 'Please check your email to active account' }, status: :ok
          else
            render json: @user.errors.full_messages, status: :unprocessable_entity
          end
        end

        def edit; end

        def update
          if @user.update(user_params)
            render json: { user: @user }, status: :ok
          else
            render json: { error: 'Update false' }, status: :unprocessable_entity
          end
        end

        def destroy
          @user.update(banned: true) unless !@user.activated?
          render json: {message: "User has been banned"}, status: :ok
        end

        def following
          @title = 'Following'
          @user = User.find(params[:id])
          @users = @user.following.paginate(page: params[:page])
          render json:{users: @users}, status: :ok
        end

        def followers
          @title = 'Followers'
          @user = User.find(params[:id])
          @users = @user.followers.paginate(page: params[:page])
          render json: {users: @users}
        end

        def voting
          @title = 'Voting'
          @vote = Vote.find(params[:id])
          @votes = @vote.voting.paginate(page: params[:page])
          render json: {votes: @votes }, status: :ok
        end

      private

        # set user with params id
        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.permit(:name, :email, :password, :password_confirmation, :image)
        end

        # Confirms a logged-in user.
        def logged_in_user
          render json: { message: 'Please log in.' }, status: :unprocessable_entity unless logged_in?
        end

        # Confirms the correct user.
        def correct_user
          @user = User.find(params[:id])
          render josn: { message: 'You have no right to do this!' } unless @user == current_user
        end

      end
    end
  end
end
