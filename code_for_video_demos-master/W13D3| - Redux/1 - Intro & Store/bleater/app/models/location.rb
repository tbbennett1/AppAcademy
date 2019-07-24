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
    <<-SQL
      SELECT locations.*
      FROM locations
      LEFT OUTER JOIN users ON locations.id = users.location_id
      LEFT OUTER JOIN bleats ON bleats.author_id = users.id
      GROUP BY locations.id
      HAVING COUNT(bleats.id) = 0
    SQL

    Location
      .left_outer_joins(users: :authored_bleats)
      .group(:id)
      .having("COUNT(bleats.id) = 0")
  end

  def self.print_all_bleats_by_location
    # puts out all bleats by 
    # author/location to console
    # ie: "tommy@appacademy.io (Argentina): You can do it!"

    Location.includes(users: :authored_bleats).all.each do |location|
      location.users.each do |user|
        user.authored_bleats.each do |bleat|
          puts "#{ user.email } (#{ location.name }): #{ bleat.body }"
        end
      end
    end

    nil
  end
end
