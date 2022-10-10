class ApplicationController < ActionController::API
  # include ActionController::Cookies
  include Pagy::Backend
  # def paginate(resource)
  #   resource = resource.page(params[:page] || 1)
  #   resource = resource.per_page(params[:per_page]) if params[:per_page]
  #   resource
  # end

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

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

  # Confirms an admin user.
  def admin_user
    @current_user.admin?
  end

  def log_out
    current_user = nil
  end


  def meta_data
    {
      total: @pagy.count,
      page: @pagy.page,
      from: @pagy.from,
      to: @pagy.to,
      pages: @pagy.pages
    }
  end
end
