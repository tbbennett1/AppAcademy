class Location < ApplicationRecord

  has_many :users,
    class_name: "User",
    foreign_key: :location_id,
    primary_key: :id

  has_many :bleats,
    through: :users,
    source: :authored_bleats

  # If we had Comment on bleats, this would be
  # a double through
  # has_many :bleat_comments,
  #   through: :bleats,
  #   source: :comments
    
  def self.quiet_locations
    # locations with no bleats
    <<-SQL
      SELECT *
      FROM locations
      LEFT OUTER JOIN users ON users.location_id = locations.id
      LEFT OUTER JOIN bleats ON bleats.author_id = users.id
      GROUP BY locations.id
      HAVING COUNT(bleats.id) = 0
    SQL

    Location
      .left_outer_joins(users: :authored_bleats)
      .group(:id)
      .having("COUNT(bleats.id) = 0")
  end

  def self.print_all_bleats_by_country
    # puts out all bleats by 
    # author/country to console
    # ie: "Tommy (Argentina): You can do it!"
    Location.includes(users: :authored_bleats).all.each do |location|
      location.users.each do |user|
        user.authored_bleats.each do |bleat|
          puts "#{ user.name } (#{ location.name }): #{ bleat.body }"
        end
      end
    end
  end
end