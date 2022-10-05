module Api
  module V1
    module User1
      class SessionsController < ApplicationController
        before_action :authorize, only: :destroy

        def create
          @user = User.find_by(email: params[:email])
          if @user && @user.valid_password?(params[:password])
            if @user.banned?
              render json: { message: 'You fukin bastard has been banned .l..' }, status: :ok 
            elsif !@user.confirmation_token?
              token = encode_token({user_id: @user.id})
              render json: {user: @user, token: token }, status: :ok
            else
              render json: { message1: 'Account not activated.',
                             message2: 'Check your email for the activation link.' }
            end

          else
            render json: { message: 'Error' }, status: :unprocessable_entity
          end
        end

        def destroy
          @current_user = nil
          render json: { message: 'Logged out' }, status: :ok
        end
      end
    end
  end
end
