require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event_from_user_one) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid with empty title" do
    subject.date = 1.day.ago
    expect(subject).to_not be_valid
  end
end
