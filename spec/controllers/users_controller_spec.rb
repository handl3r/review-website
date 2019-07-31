require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'Get #show' do
    it 'return success response' do
      User.new(email: 'test@gmail.com', role: 'Company',
               password: '111111',
               password_confirmation: '111111').save
      get :show, params: {id: User.last.to_param}

      expect(response).to be_success
    end
  end
end
