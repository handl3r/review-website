class Review < ApplicationRecord

  validates :rating, presence: true, maximum: 5
  validates :comment, allow_blank: true, length: {maximum: 200}

  belongs_to :user
  belongs_to :place
end
