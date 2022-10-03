# require 'json_web_token'
class ApplicationController < ActionController::API
  include UsersHelper
  include SessionsHelper
  include ActionController::Cookies

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    resource = resource.per_page(params[:per_page]) if params[:per_page]

    resource
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
end
