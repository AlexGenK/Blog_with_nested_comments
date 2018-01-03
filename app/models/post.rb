class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates_date :date, on_or_after: lambda { Time.now }
  
  has_many :comments, as: :commentable
end
