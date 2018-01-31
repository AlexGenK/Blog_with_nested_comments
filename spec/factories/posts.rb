FactoryBot.define do
  factory :post_from_user_one, class: Post do
    title 'Post one'
    body  'Lorem ipsum dolor sit amet.'
    user 'foo1@bar.com'
  end

  factory :post_from_user_two, class: Post do
    title 'Post two'
    body  'Aenean vulputate eleifend tellus'
    user 'foo2@bar.com'
  end
end