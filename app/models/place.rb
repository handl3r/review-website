class Place < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :photos
  has_many :reviews
  # For use case when want to find places by service. so use has_and_belongs_to_many
  # has_and_belongs_to_many :services
  # But if just want to find services of a place so use has many, belongs_to
  has_many :services
  validates :name, presence: true, length: {maximum: 30}
  validates :address, presence: true
  validates :numberRatings, presence: true
  validates :mediumRating, presence: true
  validates :phoneNumber, presence: true

  validates :description, presence: true, length: { minimum: 20 }
end
