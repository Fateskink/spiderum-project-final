class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token

  devise :database_authenticatable

  has_many :posts, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one_attached :image

  has_many :active_relationships, class_name: 'Relationship',
  foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
  foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  before_save :downcase_email
  before_create :generate_confirmation_instructions

  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
                            size: { less_than: 5.megabytes, message: "should be less than 5MB" }

  # Returns a resized image for display.
  def display_image
    image.variant(resize_to_limit: [200, 200]) # maybe change image size, dependent on future feature
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                    WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
    OR user_id = :user_id", user_id: id).includes(:user, image_attachment: :blob)
  end

  # Follows a user.
  def follow(other_user)
    following << other_user unless self == other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end

  def confirmation_token_valid?
    (self.confirmation_sent_at + 30.days) > Time.now.utc
  end
  
  def mark_as_confirmed!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    save
  end

end
