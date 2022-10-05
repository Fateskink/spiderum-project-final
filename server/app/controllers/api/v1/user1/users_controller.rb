module Api
  module V1
    module User1
      class UsersController < ApplicationController
        before_action :authorize, only: %i[index edit update destroy]
        before_action :set_user, only: %i[show edit update destroy]
        before_action :correct_user, only: %i[edit update]
        before_action :admin_user, only: :destroy

        def index
          @users = User.paginate(page: params[:page], per_page: 20)
          render json: { users: @users }, status: :ok
        end

        def show
          token = encode_token({user_id: @user.id})
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

        def edit
        end

        def update
          if @current_user.update_new_email!(@new_email)
            @user.send_update_email
            render json: { status: 'Email Confirmation has been sent to your new Email.' }, status: :ok
          else
            render json: { errors: @current_user.errors.values.full_messages }, status: :bad_request
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

        def confirm
          token = params[:token].to_s
          @user = User.find_by(confirmation_token: token)
          if @user.present? && @user.confirmation_sent_at + 30.days > Time.now.utc
            @user.confirmation_token = nil
            @user.confirmed_at = Time.now.utc
            @user.save
            render json: {status: 'User confirmed successfully'}, status: :ok
          else
            render json: {status: 'Invalid token'}, status: :not_found
          end
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
      end
    end
  end
end
