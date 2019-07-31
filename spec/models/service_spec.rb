require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'test validates' do
    common_data = { name: 'service1' }
    it 'ensures name uniqueness' do
      service1 = Service.first
      service = Service.new(common_data.merge(name: service1.name)).save
      expect(service).to eq(false)
    end
    it 'ensures success' do
      service = Service.new(common_data).save
      expect(service).to eq(true)
    end
  end
end
