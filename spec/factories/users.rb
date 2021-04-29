FactoryBot.define do
  factory :user, class: User do
    name { 'lulu' }
    email { 'lulu@gmail.com' }
    password { '123' }
  end
  factory :instructor, class: User do
    name { 'floor' }
    email { 'floor@gmail.com' }
    password { '1234' }
    role { 'instructor' }
  end
  factory :admin, class: User do
    name { 'diego' }
    email { 'diego@gmail.com' }
    password { '12345' }
    role { 'admin' }
  end
end
