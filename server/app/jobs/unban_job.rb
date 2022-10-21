class UnbanJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    user.unban
    UnbanJob.set(wait: 1.weel).perform_later(user)
  end
end
