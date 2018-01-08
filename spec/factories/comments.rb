FactoryBot.define do
  factory :comment_for_post, class: Comment do
    body  "Aenean commodo ligula eget dolor."
    user "foo2@bar.com"
    association :commentable, factory: :article_from_user_one
  end

  factory :comment_for_comment, class: Comment do
    body  "Sed ut perspiciatis unde omnis iste natus."
    user "foo1@bar.com"
    association :commentable, factory: :comment_for_post
  end
end