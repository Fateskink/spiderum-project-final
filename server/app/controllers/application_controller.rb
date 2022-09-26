# require 'json_web_token'
class ApplicationController < ActionController::API
  include UsersHelper
  include SessionsHelper
  include ActionController::Cookies

private
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    render json:{message: "Please log in."}, status: :unprocessable_entity 
    end
  end
end
