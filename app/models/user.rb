# frozen_string_literal: true

class User < ApplicationRecord

  validates :type, presence: true, maximum: 3
  validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  # Only company must has address and website
  validates :address, presence: true, if: (type? == 1)
  validates :website, presence: true, if: (type? == 1)
  validates :phoneNumber, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :description, presence: true, if: (type? == 1), length: {minimum: 20}
  validates :description, allow_blank: true, if: ((type? == 2) || (type? == 3))
  validates :password_digest, presence: true

  has_many :places
  has_many :reviews
  has_one :photo
  
  def type?
    type
  end
end
