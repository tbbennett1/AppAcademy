# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collection < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  
  has_many :artwork_collections

  has_many :artworks,
  through: :artwork_collections,
  source: :artwork

end
