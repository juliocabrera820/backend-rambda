require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  before(:all) do
    post '/api/v1/authentication/sign_up', params: { name: 'lulu', email: 'lulu@gmail.com', password: '123' }
  end
  describe 'POST /authentication/sign_up' do
    it 'returns valid user' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq('message' => 'user created successfully')
    end
    it 'returns record invalid' do
      post '/api/v1/authentication/sign_up', params: { name: 'lulu', email: 'lulu@gmail.com', password: '123' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq('message' => 'record invalid')
    end
  end
  describe 'POST /authentication/sign_in' do
    it 'returns a token' do
      post '/api/v1/authentication/sign_in', params: { email: 'lulu@gmail.com', password: '123' }
      expect(response).to have_http_status(:success)
    end
    it 'returns a http status 422' do
      post '/api/v1/authentication/sign_in', params: { email: 'lulu@gmail.com', password: '12' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq('message' => 'password is wrong')
    end
  end
end
