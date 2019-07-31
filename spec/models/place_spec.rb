require 'rails_helper'

RSpec.describe Place, type: :model do
  common_data = {user_id: 1, address: 'xxx', service_id: 1,numberRatings: 0,
                  mediumRating: 0, phoneNumber: '000-000-0000', description: 't'*20}
  context 'test validates' do
    it 'ensures address presence' do
      place = Place.new(common_data.merge(address: nil)).save
      expect(place).to eq(false)
    end
    it 'ensures numberRatings presence' do
      place = Place.new(common_data.merge(numberRatings: nil)).save
      expect(place).to eq(false)
    end
    it 'ensures mediumRating presence' do
      place = Place.new(common_data.merge(mediumRating: nil)).save
      expect(place).to eq(false)
    end
    it 'ensures phoneNumber presence' do
      place = Place.new(common_data.merge(phoneNumber: nil)).save
      expect(place).to eq(false)
    end
    it 'ensures description presence' do
      place = Place.new(common_data.merge(description: nil)).save
      expect(place).to eq(false)
    end
    it 'ensures description must have minimum length 20' do
      place = Place.new(common_data.merge(description: 't'*19)).save
      expect(place).to eq(false)
    end
    it 'ensures address presence' do
      place = Place.new(common_data).save
      expect(place).to eq(true)
    end
  end

end
