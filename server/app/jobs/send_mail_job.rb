class SendMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    user.send_activation_email
  end
end
