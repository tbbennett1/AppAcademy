# == Schema Information
#
# Table name: users
#
#  id          :bigint(8)        not null, primary key
#  email       :string
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ApplicationRecord

  has_many :authored_bleats,
    class_name: "Bleat",
    primary_key: :id,
    foreign_key: :author_id

  belongs_to :location,
    class_name: "Location",
    primary_key: :id,
    foreign_key: :location_id

  def self.loquacious_users
    # users with 2+ bleats
    <<-SQL
      SELECT users.*, COUNT(bleats.id) AS bleat_count
      FROM users
      JOIN bleats ON bleats.author_id = users.id
      GROUP BY users.id
      HAVING COUNT(bleats.id) >= 2
    SQL

    User
      .select("users.*, COUNT(bleats.id) AS bleat_count")
      .joins(:authored_bleats)
      .group(:id)
      .having("COUNT(bleats.id) >= 2")
  end

  def self.quiet_users
    # users with no bleats
    <<-SQL
      SELECT users.*
      FROM users
      LEFT OUTER JOIN bleats ON bleats.author_id = users.id
      GROUP BY users.id
      HAVING COUNT(bleats.id) = 0
    SQL

    User
      .left_outer_joins(:authored_bleats)
      .group(:id)
      .having("COUNT(bleats.id) = 0")
  end
end
