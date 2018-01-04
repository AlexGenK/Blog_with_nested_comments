FactoryBot.define do
  factory :post_article, class: Post do
    title 'Article one'
    body  'Lorem ipsum dolor sit amet.'
    kind 'article'
    user 'user1@mail.no'
    date Time.now
  end

  factory :post_event, class: Post do
    title 'Event two'
    body  'Aenean vulputate eleifend tellus'
    kind 'event'
    user 'user2@mail.no'
    date Time.now
  end
end