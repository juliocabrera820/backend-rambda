FactoryBot.define do
  factory :ruby, class: User do
    name { 'lulu' }
    email { 'lulu@gmail.com' }
    password { '123' }
  end
end
