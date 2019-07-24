# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord

  has_many :users,
    class_name: "User",
    primary_key: :id,
    foreign_key: :location_id

  has_many :bleats,
    through: :users,
    source: :authored_bleats

  # has_many :comments,
  #   through: :bleats,
  #   source: :comments

  def self.quiet_locations
    # locations with no bleats
  end

  def self.print_all_bleats_by_location
    # puts out all bleats by 
    # author/location to console
    # ie: "Tommy (Argentina): You can do it!"
  end
end
