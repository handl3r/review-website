class Place < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :photos
  has_many :reviews
  # For use case when want to find places by service. so use has_and_belongs_to_many
  # has_and_belongs_to_many :services
  # But if just want to find services of a place so use has many, belongs_to
  has_many :services
  has_many_attached :images
  validates :name, presence: true, length: {maximum: 30}
  validates :address, presence: true
  validates :numberRatings, presence: true
  validates :mediumRating, presence: true
  validates :phoneNumber, presence: true

  validates :description, presence: true, length: {minimum: 20}

  public

  def increase_rating(hash_value)
    if hash_value[:type] == 1 # new review
      self.numberRatings += 1
      self.mediumRating *= ((self.numberRatings - 1).to_f / self.numberRatings)
      self.mediumRating += hash_value[:rating].to_f / self.numberRatings
    elsif hash_value[:type] == 2 # edit review
      review = Review.find_by(id: hash_value[:review_id])
      self.mediumRating += ((hash_value[:rating].to_f - review.rating).to_f / self.numberRatings)
    end
    self.save
  end

  def find_same_type_place
    service = self.service
    result = []
    Place.all.each do |place|
      unless place.id == self.id
        if service == place.service
          result.push(place)
        end
      end
    end
    result.sort_by! { |place| place.mediumRating }.reverse!
  end
end
