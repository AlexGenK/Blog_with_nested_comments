FactoryBot.define do
  factory :user_one, class: User do
    email 'foo1@bar.com'
    password '123456'
  end
end