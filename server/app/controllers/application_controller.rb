# require 'json_web_token'
class ApplicationController < ActionController::API
  include UsersHelper
  # include SessionsHelper
  include ActionController::Cookies

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    resource = resource.per_page(params[:per_page]) if params[:per_page]

    resource
  end

  def current_user
    # if (user_id = cookies.encrypted[:user_id])
    #   user = User.find_by(id: user_id)
    #   if user && user.authenticated?(:remember, cookies[:remember_token])
    #     @current_user = user
    #   end
    # else
      @current_user ||= User.find_by(id: params[:id])
    # end
  end

  private

  # Confirms a logged-in user.
  def logged_in_user
    render json: { message: 'Please log in.' }, status: :unprocessable_entity unless logged_in?
  end

  # Confirms an admin user.
  def admin_user
    current_user.admin?
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    current_user = nil
  end
end
