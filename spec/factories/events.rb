FactoryBot.define do
  factory :event_from_user_one, class: Event do
    title 'Event one'
    body  'Lorem ipsum dolor sit amet.'
    date  Time.now
    user  'foo1@bar.com'
  end
end
