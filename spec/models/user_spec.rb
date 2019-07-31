# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  common_data = {password: '111111',
                 password_confirmation: '111111'}
  context 'validates tests' do
    it 'ensures role is presence' do
      user = User.new(common_data.merge(email: 'test@gmail.com')).save
      expect(user).to eq(false)
    end
    it 'ensures email is presence' do
      user = User.new(common_data.merge(role: 'Company')).save
      expect(user).to eq(false)
    end
    it 'test case sensitive of email' do
      User.new(common_data.merge(email: 'test@gmail.com',
                                 role: 'Company')).save
      user_sen = User.new(common_data.merge(email: 'TesT@gmail.com',
                                            role: 'Company')).save
      expect(user_sen).to eq(false)
    end
    it 'check regex of email' do
      number_user_before = User.count
      User.new(common_data.merge(email: 'testgmail.com',
                                 role: 'Company')).save
      User.new(common_data.merge(email: 'test@gmailcom',
                                 role: 'Company')).save
      expect(User.count).to eq(number_user_before)
    end
    it 'ensures description length has minimum is 20' do
      user = User.new(common_data.merge(email: 'test@gmail.com',
                                        role: 'Company',
                                        description: 'd' * 19)).save
      expect(user).to eq(false)
    end
    it 'check regex phoneNumber' do
      user = User.new(common_data.merge(email: 'test@gmail.com',
                                        role: 'Company',
                                        phoneNumber: '000dsa')).save
      expect(user).to eq(false)
    end
    it 'ensures should save successfully' do
      user = User.new(email: 'test@gmail.com', role: 'Company', name: 'test',
                      address: 'test',
                      website: 'test',
                      phoneNumber: '000-000-0000', description: 'd' * 20,
                      password: '111111',
                      password_confirmation: '111111').save
      expect(user).to eq(true)
    end

  end
end
