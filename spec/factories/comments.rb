FactoryBot.define do
  factory :comment do
    body  "Aenean commodo ligula eget dolor."
    user "user1@mail.no"
    association :commentable, factory: :post
  end
end