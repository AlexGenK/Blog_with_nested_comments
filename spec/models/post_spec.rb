require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:event_from_user_two) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with empty title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with empty body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with date early that now" do
    subject.date = 1.day.ago
    expect(subject).to_not be_valid
  end

  describe 'Post #is_event?' do
    it "is return 'true' when kind of post is event" do
      expect(subject.is_event?).to be true
      article=build(:article_from_user_one)
      expect(article.is_event?).to be false
    end
  end
end
