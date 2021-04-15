require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'validations' do
    it { should validate_presence_of :lesson_number }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :video_url }
    it { should validate_numericality_of(:lesson_number) }
  end
  describe 'relationships' do
    it { should belong_to(:course) }
  end
end
