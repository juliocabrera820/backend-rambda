FactoryBot.define do
  factory :user, class: Course do
    name { 'Ruby course' }
    description { 'Introduction to OOP' }
    duration { 300 }
    price { 130 }
    level { 'basic' }
    programming_language { 'Ruby' }
  end
  factory :random_course, class: Course do
    name { Faker::Educator.course_name }
    description { Faker::Faker::Book.title }
    duration { Faker::Number.number(digits: 3) }
    price { Faker::Number.number(digits: 3) }
    level { Faker::Job.education_level }
    programming_language { Faker::ProgrammingLanguage.name }
  end
end
