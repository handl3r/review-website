class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, presence: true
  validates :comment, allow_blank: true, length: {maximum: 200}
  validates :user_id, uniqueness: {scope: :place_id, message: "one user connot review a place more than 2 times"}

end
