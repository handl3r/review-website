require 'rails_helper'

RSpec.describe Photo, type: :model do
  context 'test validates' do
    it 'ensures path presence' do
      photo = Photo.new(user_id: 1, place_id: nil, photo_type: 'Avatar').save
      expect(photo).to eq(false)
    end
    it 'ensures path uniqueness' do
      photo1 = Photo.first
      photo = Photo.new(user_id: 1, place_id: nil, photo_type: 'Avatar', path: photo1.path).save
      expect(photo).to eq(false)
    end
  end
end
