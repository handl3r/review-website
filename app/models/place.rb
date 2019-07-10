class Place < ApplicationRecord

  validates :address, presence: true
  validates :numberRatings, presence: true
  validates :mediumRating, presence: true, maximum: 5
  validates :phoneNumber, presence: true
  validates :timeOpen, presence: true
  validates :timeOpen, presence: true
  validates :description, presence: true, length: {minimum: 20}

  belongs_to :user
  has_many :photos
  has_and_belongs_to_many :services
  has_many :reviews
end
