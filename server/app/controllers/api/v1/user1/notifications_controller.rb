module Api
  module V1
    module User1
      class NotificationsController < ApplicationController
        before_action :find_notificationable

        # def create_notifications
        #   @notification = @notificationable.notification.build
        #   @notification.user_id = @notificationable.user_id
        #   @notification.notified_by_id = @current_user.id
        #   @notification.save
        # end

        # # notified_by.each do |recipient|
        # #   Notification.create(recipient: recipient, actor: self.user,
        # #     action: 'posted', notifiable: self)
        # # end

        # private

        # def find_notificationable
        #   if params[:comment_id]
        #     @notificationable = Comment.find_by_id(params[:comment_id])
        #   elsif params[:post_id]
        #     @notificationable = Post.find_by_id(params[:post_id])
        #   end
        # end
      end
    end
  end
end
