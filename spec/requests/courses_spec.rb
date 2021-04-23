require 'rails_helper'
require 'shared_contexts'

RSpec.describe 'Courses', type: :request do
  include_context 'instructor sign up request'

  describe 'GET /users/1/courses' do
    it 'returns a 401 due to the authorization header is missing' do
      get '/api/v1/users/1/courses'
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns a 403 due to authorization header is invalid' do
      get '/api/v1/users/2/courses', headers: { Authorization: 'Bearer ' }
      expect(response).to have_http_status(:forbidden)
    end
    it 'returns an empty array' do
      get '/api/v1/users/3/courses', headers: { Authorization: "Bearer #{access_token}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
  describe 'POST /users/4/courses' do
    it 'returns a new course' do
      post '/api/v1/users/4/courses', headers: { Authorization: "Bearer #{access_token}" },
                                      params: { name: 'java', description: 'basic course', duration: 300, price: 150,
                                                level: 'basic', programming_language: 'java', featured_image: image }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq('message' => 'course created successfully')
    end
  end
  describe 'GET /users/5/courses/2' do
    it 'returns a ruby course' do
      token = access_token
      post '/api/v1/users/5/courses', headers: { Authorization: "Bearer #{token}" },
                                      params: { name: 'ruby', description: 'advanced course', duration: 350, price: 200,
                                                level: 'advanced', programming_language: 'ruby' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq('message' => 'course created successfully')
      get '/api/v1/users/5/courses/2', headers: { Authorization: "Bearer #{token}" }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        'id' => 2, 'name' => 'ruby', 'description' => 'advanced course', 'duration' => 350, 'price' => 200.0,
        'level' => 'advanced', 'programming_language' => 'ruby', 'image_url' => nil
      )
    end
  end
end
