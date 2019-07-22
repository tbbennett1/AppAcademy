# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true

end
