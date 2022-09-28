# require 'json_web_token'
class ApplicationController < ActionController::API
  include UsersHelper
  include SessionsHelper
  include ActionController::Cookies
  
  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    if params[:per_page]
      resource = resource.per_page(params[:per_page])
    end

    return resource
  end
private
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
    render json:{message: "Please log in."}, status: :unprocessable_entity 
    end
  end
end
