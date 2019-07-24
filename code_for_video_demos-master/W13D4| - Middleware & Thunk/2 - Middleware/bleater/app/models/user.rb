# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  location_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string
#  password_digest :string
#
# tommy = User.new(email: 'tommy@appacademy.io', password: 'hunter2')
# tommy = User.new
# tommy.email = 'tommy@appacademy.io'
# tommy.password = 'hunter2'

# tommy.save
# tommy.password #=> validations

# t = User.find_by(email: 'tommy@appacademy.io')
# t = User.new({id: 1, email: 'tommy@appacademy.io', password_digest: 'asdfasdfas'})
# t.id = 1
# t.email = 'tommy@...'
# t.password_digest = 'asdfasdf'
# t.update({email: 'tduek@appacademy.io'})


class User < ApplicationRecord

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token
  # # validations call getter methods for each attribute
  # # since password isn't a column, we need to create a getter method for it
  attr_reader :password
  # # def password
  # #   @password
  # # end

  has_many :authored_bleats,
    class_name: "Bleat",
    primary_key: :id,
    foreign_key: :author_id

  belongs_to :location,
    class_name: "Location",
    primary_key: :id,
    foreign_key: :location_id

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email) # could be a user, could be nil
    return nil unless user && user.is_password?(password) # is_password? only executes if user is a User object, not nil
    user
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    # `create` takes a plaintext password, hashes and salts it and spits out a digest
  end

  def reset_session_token!
    # remember to not only generate a new session token, but also to save it to the database
    # this will not work if you don't save to the database
    self.update!(session_token: self.class.generate_session_token)
    # return the new token for convenience
    self.session_token
  end

  def is_password?(password)
    # password_digest is just a string
    # convert it into a BCrypt::Password object so that we can call #is_password? on it
    bcrypt_password = BCrypt::Password.new(self.password_digest) # just turns it into a Password object, doesn't hash it again
    bcrypt_password.is_password?(password) # this is_password? is a different method entirely
  end

  private

  def ensure_session_token
    # this will run whenever we instantiate a User object
    # that could happen because we're creating a new record,
    # or because we pulled one out of the database
    # that's why we use conditional assignment
    self.session_token ||= self.class.generate_session_token
  end
end
