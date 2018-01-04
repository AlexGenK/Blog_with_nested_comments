require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment_for_post) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end
end
