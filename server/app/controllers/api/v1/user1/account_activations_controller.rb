module Api
  module V1
    module User1
      class AccountActivationsController < ApplicationController
        
        def edit
          @user = User.find_by(email: params[:email])
          if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
            @user.activate
            token = JsonWebToken.encode({ user_id: @user.id })
            render json: { message: 'Account activated!', user: @user, token: token}, status: :ok
          else
            render json: { message1: 'Invalid activation link'}, 
            status: :unprocessable_entity
          end
        end

        # def edit
        #   user = User.find_by(email: params[:email])
        #   if user && !user.activated? && user.authenticated?(:activation, params[:id])
        #     user.activate
        #     log_in user
        #     flash[:success] = "Account activated!"
        #     redirect_to user
        #   else
        #     flash[:danger] = "Invalid activation link"
        #     redirect_to root_url
        #   end
        # end
      end
    end
  end
end
