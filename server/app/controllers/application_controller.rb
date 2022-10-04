# require 'json_web_token'
class ApplicationController < ActionController::API
  # include UsersHelper
  # include ActionController::Cookies

  def paginate(resource)
    resource = resource.page(params[:page] || 1)
    resource = resource.per_page(params[:per_page]) if params[:per_page]

    resource
  end

  # def current_user
  #   if (user_id = cookies.encrypted[:user_id])
  #     user = User.find_by(id: user_id)
  #     if user && user.authenticated?(:remember, cookies[:remember_token])
  #       @current_user = user
  #     end
  #   else
  #     @current_user ||= User.find_by(id: params[:id])
  #   end
  # end
  
  def encode_token(payload)
    JWT.encode(payload, 'secret')  
  end

  # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws
  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_user
    decoded_token = decode_token()
    if decoded_token
        user_id = decoded_token[0]['user_id']
        @current_user = User.find_by(id: user_id)
    end
  end

  def authorize
    render json: { message: 'You have to log in.'}, status: :unauthorized unless
    authorized_user
  end

  private

  # Confirms a logged-in user.
  def logged_in_user
    render json: { message: 'Please log in.' }, status: :unprocessable_entity unless logged_in?
  end

  # Confirms an admin user.
  def admin_user
    @current_user.admin?
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    # forget(current_user)
    current_user = nil
  end
end
