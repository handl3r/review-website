# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Place, type: :model do
  firstUser = User.first
  firstService = Service.first
  common_data = { user_id: firstUser.id, address: 'xxx',
                  service_id: firstService.id,
                  numberRatings: 0, name: 'xxx',
                  mediumRating: 0, phoneNumber: '000-000-0000',
                  description: 't' * 20 }
  context 'test validates' do
    it 'ensures name presence' do
      place = Place.new(common_data.merge(name: nil)).save
      expect(place).to eq(false)
    end
    it 'ensures name has maximum is 30' do
      place = Place.new(common_data.merge(name: 't'*31)).save
      expect(place).to eq(false)
    end
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
      place = Place.new(common_data.merge(description: 't' * 19)).save
      expect(place).to eq(false)
    end
    it 'ensures success' do
      place = Place.new(common_data).save
      expect(place).to eq(true)

    end
  end
end
