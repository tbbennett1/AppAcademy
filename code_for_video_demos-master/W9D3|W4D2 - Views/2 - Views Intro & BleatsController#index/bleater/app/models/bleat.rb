class Bleat < ApplicationRecord

  # validate :body_length
  validates :body, length: {maximum: 150}

  belongs_to(:author, 
    class_name: "User", 
    foreign_key: :author_id, 
    primary_key: :id,
    # optional: false
  )

  has_one :location,
    through: :author,
    source: :location

  # def body_length
  #   if self.body.length > 150
  #     self.errors[:body] << "is too long (max 150 chars)"
  #   end
  # end

end