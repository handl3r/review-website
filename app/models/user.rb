class User < ApplicationRecord

  validates :type, presence: true
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  # Only company must has address and website
  validates :address, presence: true
  validates :website, presence: true
  validates :phoneNumber, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {minimum: 20}
  validates :password_digest, presence: true

  has_many :places
  has_many :reviews
  has_one :photo

end
