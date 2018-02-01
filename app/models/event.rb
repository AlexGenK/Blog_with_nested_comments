class Event < Post
  validates_date :date, on_or_after: lambda { Time.now }
end
