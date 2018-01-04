FactoryBot.define do
  factory :comment_for_post, class: Comment do
    body  "Aenean commodo ligula eget dolor."
    user "user1@mail.no"
    association :commentable, factory: :post_article
  end

  factory :comment_for_comment, class: Comment do
    body  "Aenean commodo ligula eget dolor."
    user "user2@mail.no"
    association :commentable, factory: :comment_for_post
  end
end