require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :price }
    it { should validate_presence_of :level }
    it { should validate_presence_of :programming_language }
    it { should validate_numericality_of(:duration) }
  end
  describe 'relationships' do
    it { should have_many(:lessons) }
    it { should have_many(:sales) }
    it { should have_and_belong_to_many(:topics) }
    it { should have_one_attached(:featured_image) }
  end
end
