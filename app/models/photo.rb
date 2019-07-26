class Photo < ApplicationRecord
   # belongs_to :user
   # belongs_to :place
  validates :path, uniqueness: true, presence: true
  enum photo_type: { Avatar: 1, ImagePlace: 2 }
end