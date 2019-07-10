# frozen_string_literal: true

class Photo < ApplicationRecord

  validates :type, maximum: 2, uniqueness: true
  validates :path, uniqueness: true, presence: true
  
  belongs_to :place
  belongs_to :user

end
