module Api
  module V1
    module User1
      class PasswordController < ApplicationController
        # before_action :set_user, only: [:edit, :update]
        # before_action :valid_user, only: [:edit, :update]
        # before_action :check_expiration, only: [:edit, :update]

        def forgot
          if params[:email].blank?
            return render json: {error: 'Email is invalid'}
          end
          @user = User.find_by(email: params[:email])
          if @user.present? && @user.confirmed_at?
            @user.generate_password_token!
            @user.send_password_reset_email
            render json: {message: 'Check your email to reset password!'}, status: :ok
          else
            render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
          end
        end
      
        def reset
          token = params[:token].to_s
          if params[:email].blank?
            return render json: {error: 'Token not present'}
          end
          @user = User.find_by(reset_password_token: token)      
          if @user.present? && @user.password_token_valid?
            if @user.reset_password!(params[:password])
              render json: {status: 'ok'}, status: :ok
            else
              render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
            end
          else
            render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
          end
        end

        def update
          if !params[:password].present?
            render json: {error: 'Password is invalid'}, status: :unprocessable_entity
            return
          end
        
          if @current_user.reset_password(params[:password])
            render json: {status: 'Password is reset'}, status: :ok
          else
            render json: {errors: current_user.errors.full_messages}, status: :unprocessable_entity
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