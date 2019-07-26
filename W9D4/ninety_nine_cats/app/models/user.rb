# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

    def self.generate
        SecureRandom::urlsafe_base64(16)
    end

    def self.find_by_credentials(user_name, password)
      user = User.find_by(user_name: user_name)
      return nil unless user && user.is_password?(password)
      user
    end

    def reset_session_token!
        self.update!(session_token: self.class.generate)
        self.session_token
    end

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end


    def is_password?(password)
        encrypted_password = BCrypt::Password.new(self.password_digest)
        encrypted_password.is_password?(password)
    end


end
