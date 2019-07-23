# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  artwork_id :integer          not null
#

class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :artwork_id, presence: true

	belongs_to :author,
	foreign_key: :user_id,
	class_name: 'User'

	belongs_to :artwork, 
	foreign_key: :artwork_id, 
	class_name: 'Artwork'

	has_many :likes, as: :likeable

end
