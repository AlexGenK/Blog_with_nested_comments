FactoryBot.define do
  factory :post do
    title 'Post'
    body  'Lorem ipsum dolor sit amet.'
    kind 'article'
    user 'user1@mail.no'
    date Time.now
  end
end