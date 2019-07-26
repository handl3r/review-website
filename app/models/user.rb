# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { Company: 1, Reviewer: 2 }
  validates :role, presence: true
  # validates :name, presence: true, length: {maximum: 50}, uniqueness: true
  # Only company must has address and website
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates_format_of :phoneNumber,
                      allow_blank: true,
                      with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
                      message: '- Phone numbers must be in xxx-xxx-xxxx format.'
  validates :description, allow_blank: true, length: { minimum: 20 }

  has_many :places
  has_many :reviews
  has_one :photo
end
