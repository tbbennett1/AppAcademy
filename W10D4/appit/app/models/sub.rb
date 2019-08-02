class Sub < ApplicationRecord
	validates :title, :description, presence: true

	belongs_to :moderator,
		class_name: :User,
		primary_key: :id,
		foreign_key: :moderator_id

	has_many :posts,
		class_name: :Post,
		primary_key: :id,
		foreign_key: :sub_id
		
end
