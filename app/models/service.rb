class Service < ApplicationRecord
  belongs_to :place
  has_and_belongs_to_many :places
end
