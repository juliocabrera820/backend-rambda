RSpec.shared_context 'user sign up request' do
  before(:each) do
    FactoryBot.create :instructor
  end
end

RSpec.shared_context 'instructor sign up request' do
  before(:each) do
    FactoryBot.create :instructor
  end
  image_path = Rails.root.join('spec', 'support', 'attachments', 'gem.jpg')
  let(:image) { Rack::Test::UploadedFile.new(image_path, 'image/jpg') }
  def access_token
    post '/api/v1/authentication/sign_in', params: { email: 'floor@gmail.com', password: '1234' }
    response.body
  end
end

RSpec.shared_context 'admin sign up request' do
  before(:each) do
    FactoryBot.create :instructor
  end
end
