module Api
  module V1
    module User1
      class PasswordResetsController < ApplicationController
        before_action :set_user, only: [:edit, :update]
        before_action :valid_user, only: [:edit, :update]
        before_action :check_expiration, only: [:edit, :update]
        def new
        end

        def create
          @user = User.find_by(email: params[:email].downcase)
          if @user
            @user.create_reset_digest
            @user.send_password_reset_email
            render json: {message: "Email sent with password reset instructions"}, status: :ok
          else
            render json: {message: "Email address not found"}, status: :unprocessable_entity
          end
        end

        def edit
        end

        def update
          if params[:user][:password].empty?
            render json: {message: "Password can't be empty"}, status: :unprocessable_entity
          elsif @user.update(user_params)
            @user.update_attribute(:reset_digest, nil)
            render json: {message: "Password has been reset.", user: @user}, status: :ok
          else
            render json: {message: "False to reset password"}, status: :unprocessable_entity
          end
        end

      private

        def user_params
          params.require(:user).permit(:password, :password_confirmation)
        end

        def set_user
          @user = User.find_by(email: params[:email])
        end

        # Confirms a valid user.
        def valid_user
          unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
            render json: {message: "You need to active your email first!"}, status: :unprocessable_entity
          end
        end

        def check_expiration
          if @user.password_reset_expired?
            render json: {message: "Password reset has expired."}
          end
        end
      end
    end
  end
end