class User < ApplicationRecord
  validates :email, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6}, allow_nil: true

  # after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.session_token.save!
    self.session_token
  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end
end