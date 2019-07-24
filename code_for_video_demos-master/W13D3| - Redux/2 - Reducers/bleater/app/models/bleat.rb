# == Schema Information
#
# Table name: bleats
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Bleat < ApplicationRecord

  # validate :ensure_bleats_arent_long
  validates :body, presence: true
  validates :body, length: {maximum: 150}

  belongs_to :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :author_id
    # optional: true

  has_one :location,
    through: :author,
    source: :location


  # def ensure_bleats_arent_long
  #   self
  #   if self.body && self.body.length > 150
  #     self.errors[:body] << "is too long (max is 150 chars)"
  #   end
  # end
end
