module Api
  module V1
    module User1
      class PasswordController < ApplicationController
        before_action :authorize

        def forgot
          return render json: { error: 'Email is invalid' } if params[:email].blank?

          @user = User.find_by(email: params[:email])
          if @user.present? && @user.confirmed_at?
            @user.generate_password_token!
            @user.send_password_reset_email
            render json: { message: 'Check your email to reset password!' }, status: :ok
          else
            render json: { error: ['Email address not found. Please check and try again.'] },
                   status: :not_found
          end
        end

        def reset
          token = params[:token].to_s
          return render json: { error: 'Token not present' } if params[:email].blank?

          @user = User.find_by(reset_password_token: token)
          if @user.present? && @user.password_token_valid?
            if @user.reset_password!(params[:password])
              render json: { status: 'ok' }, status: :ok
            else
              render json: { error: @user.errors.full_messages },
                     status: :unprocessable_entity
            end
          else
            render json: { error: ['Link not valid or expired. Try generating a new link.'] },
                   status: :not_found
          end
        end

        def update
          unless params[:password].present?
            render json: { error: 'Password is invalid' }, status: :unprocessable_entity
            return
          end

          if @current_user.reset_password!(params[:password])
            render json: { status: 'Password is reset' }, status: :ok
          else
            render json: { errors: current_user.errors.full_messages },
                   status: :unprocessable_entity
          end
        end
      end
    end
  end
end
