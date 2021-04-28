require 'rails_helper'
require 'shared_contexts'

RSpec.describe 'Authentication', type: :request do
  include_context 'user sign up request'

  describe 'POST /authentication/sign_up' do
    before(:each) do
      post '/api/v1/authentication/sign_up', params: { name: 'lulu', email: 'lulu@gmail.com', password: '123' }
    end
    it 'returns valid user' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq('message' => 'user created successfully')
    end
    it 'returns record invalid due to an existing email error' do
      post '/api/v1/authentication/sign_up', params: { name: 'lulu', email: 'lulu@gmail.com', password: '123456' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq('message' => 'record invalid')
    end
  end
  describe 'POST /authentication/sign_in' do
    it 'returns a token' do
      post '/api/v1/authentication/sign_in', params: { email: user.email, password: user.password }
      expect(response).to have_http_status(:success)
    end
    it 'returns a http status 422' do
      post '/api/v1/authentication/sign_in', params: { email: user.email, password: '12' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq('message' => 'password is wrong')
    end
  end
end
