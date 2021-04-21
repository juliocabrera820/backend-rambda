require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  before(:all) do
    post '/api/v1/authentication/sign_up',
         params: { name: 'laura', email: 'laura@gmail.com', password: '123', role: 'instructor' }
  end
  describe 'GET /users/1/courses' do
    it 'returns a 401 due to the authorization header is missing' do
      get '/api/v1/users/1/courses'
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns a 403 due to authorization header is invalid' do
      get '/api/v1/users/1/courses', headers: { Authorization: 'Bearer ' }
      expect(response).to have_http_status(:forbidden)
    end
    it 'returns an empty array' do
      post '/api/v1/authentication/sign_in', params: { email: 'laura@gmail.com', password: '123' }
      token = response.body
      get '/api/v1/users/1/courses', headers: { Authorization: "Bearer #{token}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
  describe 'POST /users/1/courses' do
    it 'returns a new course' do
      post '/api/v1/authentication/sign_in', params: { email: 'laura@gmail.com', password: '123' }
      token = response.body
      post '/api/v1/users/1/courses', headers: { Authorization: "Bearer #{token}" },
                                      params: { name: 'java', description: 'basic course', duration: 300, price: 150,
                                                level: 'basic', programming_language: 'java' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq('message' => 'course created successfully')
    end
  end
end
