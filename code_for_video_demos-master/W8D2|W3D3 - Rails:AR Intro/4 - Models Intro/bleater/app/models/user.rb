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
end
