# require 'json_web_token'
class ApplicationController < ActionController::API
  include UsersHelper
  include SessionsHelper
  include ActionController::Cookies

  protect_from_forgery with: :null_session

  before_action :destroy_session

  protected

  def destroy_session
    request.session_options[:skip] = true
  end
  
private
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    render json:{message: "Please log in."}, status: :unprocessable_entity 
    end
  end
end
