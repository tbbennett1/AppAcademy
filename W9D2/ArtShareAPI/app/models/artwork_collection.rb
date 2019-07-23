# == Schema Information
#
# Table name: artwork_collections
#
#  id            :bigint           not null, primary key
#  artwork_id    :integer          not null
#  collection_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ArtworkCollection < ApplicationRecord
  belongs_to :collection
  belongs_to :artwork

end
