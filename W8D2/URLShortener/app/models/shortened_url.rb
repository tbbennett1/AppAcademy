class ShortenedURL < ApplicationRecord
  validates :short_url, presence: true
  validates :long_url, presence: true
  validates :user_id, presence: true
end