# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'test validates' do
    firstUser = User.first
    firstPlace = Place.first
    common_data = { user_id: firstUser.id, place_id: firstPlace.id, rating: 0,
                    comment: 'w' }
    it 'ensures rating presence' do
      review = Review.new(common_data.merge(rating: nil)).save
      expect(review).to eq(false)
    end
    it 'ensures comment presence' do
      review = Review.new(common_data.merge(comment: nil)).save
      expect(review).to eq(false )
    end
    it 'ensures user_id uniqueness' do
      review1 = Review.first
      review = Review.new(common_data.merge(user_id: review1.user_id,
                                            place_id: review1.place_id)).save
      expect(review).to eq(false)
    end
    it 'ensures success' do
      review = Review.new(common_data).save
      expect(review).to eq(true)
    end
  end
end
