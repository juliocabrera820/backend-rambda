RSpec.shared_context 'user sign up request' do
  let(:user) { FactoryBot.create(:user) }
end

RSpec.shared_context 'instructor sign up request' do
  let(:instructor) { FactoryBot.create(:instructor) }
  image_path = Rails.root.join('spec', 'support', 'attachments', 'gem.jpg')
  let(:image) { Rack::Test::UploadedFile.new(image_path, 'image/jpg') }
  def access_token
    post '/api/v1/authentication/sign_in', params: { email: instructor.email, password: instructor.password }
    response.body
  end
end

RSpec.shared_context 'admin sign up request' do
  let(:admin) { FactoryBot.create(:admin) }
end
