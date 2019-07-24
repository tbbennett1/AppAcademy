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

end
