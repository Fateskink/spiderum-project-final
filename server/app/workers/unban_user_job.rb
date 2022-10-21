class UnbanUserJob
  include Sidekiq::Worker

  def perform(user)
    @user = user
    user.unban
    # UnbanJob.set(wait: 1.minute).perform_later(user)
    UnbanUserJob.perform_in(1.minutes, 'user', 1)
  end
end
