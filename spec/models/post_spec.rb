require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post_event) }

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

end
