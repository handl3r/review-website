class Service < ApplicationRecord
  has_many :places
  # has_and_belongs_to_many :places user for case 1 in place.rb
  validates :name, uniqueness: true

end
