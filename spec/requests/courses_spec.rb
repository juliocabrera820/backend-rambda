require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'GET /courses' do
    it 'returns a 401 due to the authorization header is missing' do
      get '/api/v1/courses'
      expect(response).to have_http_status(:unauthorized)
    end
    it 'returns a 403 due to authorization header is invalid' do
      get '/api/v1/users/1/courses', headers: { Authorization: 'Bearer ' }
      expect(response).to have_http_status(:forbidden)
    end
  end
end
