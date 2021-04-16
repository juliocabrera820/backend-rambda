require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:course_id) }
    it { should validate_presence_of(:customer_id) }
  end
  describe 'relationships' do
    it { should belong_to(:course) }
    it { should belong_to(:customer) }
  end
end
