# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, presence: true
  validates :comment, presence: true
  message = 'one user cannot review a place more than 1 times'
  validates :user_id, uniqueness: { scope: :place_id, message: message }

end
