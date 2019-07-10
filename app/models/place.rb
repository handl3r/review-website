class Place < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :photos
  has_many :reviews
  has_and_belongs_to_many :services

  validates :address, presence: true
  validates :numberRatings, presence: true
  validates :mediumRating, presence: true
  validates :phoneNumber, presence: true
  validates :timeOpen, presence: true
  validates :timeOpen, presence: true
  validates :description, presence: true, length: {minimum: 20}

end
