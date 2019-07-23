# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean
#


class Artwork < ApplicationRecord
validates :title, presence: true
validates :image_url, presence: true

has_many :artwork_shares

belongs_to :artist,
foreign_key: :artist_id,
class_name: :User

has_many :shared_viewers,
through: :artwork_shares,
source: :viewer

has_many :comments,
foreign_key: :artwork_id,
class_name: :Comment,
dependent: :destroy

has_many :likes, as: :likeable
    
    def self.index_method_owned_and_shared(user_id)
        Artwork.left_outer_joins(:artwork_shares).where('(artwork_shares.viewer_id = :user_id) OR (artworks.artist_id = :user_id)', user_id: user_id)
    end
end
