FactoryBot.define do
  factory :article_from_user_one, class: Post do
    title 'Article one'
    body  'Lorem ipsum dolor sit amet.'
    kind 'article'
    user 'foo1@bar.com'
    date Time.now
  end

  factory :event_from_user_two, class: Post do
    title 'Event two'
    body  'Aenean vulputate eleifend tellus'
    kind 'event'
    user 'foo2@bar.com'
    date Time.now
  end
end