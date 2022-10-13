module Api
  module V1
    module User1
      class NotificationsController < ApplicationController
        before_action :authorize

        def index
          @notifications = @current_user.notifications
          @pagy, @notifications = pagy(@notifications)
          render json: { notifications: @notifications, metadata: meta_data }, status: :ok
        end

        def show
          @notification = Notification.find(params[:id])
          @notification.update(read_at: (@notification.read_at = Time.current))
          @notice = @notification.notificationable
          render json: @notice, status: :ok
        end
      end
    end
  end
end
