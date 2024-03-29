require 'rails_helper'

RSpec.describe 'UsersSignup', type: :request do
  describe 'POST /users' do
    
    it 'does not create a user with invalid signup information' do
      get signup_path
      expect do
        post users_path, params: { user: { name:  '',
                                          email: 'user@invalid',
                                          password:              'foo',
                                          password_confirmation: 'bar' } }
      end.not_to change(User, :count)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template('users/new')
    end

    it 'creates a user with valid signup information' do
      expect do
        post users_path, params: { user: { name:  'Example User',
                                          email: 'user@example.com',
                                          password:              'password',
                                          password_confirmation: 'password' } }
      end.to change(User, :count).by(1)
      follow_redirect!
      expect(response).to render_template('users/show')
    end
  end
end
