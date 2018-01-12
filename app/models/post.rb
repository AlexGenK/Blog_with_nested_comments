class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates_date :date, on_or_after: lambda { Time.now }, if: :is_event?
  
  has_many :comments, as: :commentable, dependent: :destroy

  def is_event?
    kind == 'event'
  end
end
