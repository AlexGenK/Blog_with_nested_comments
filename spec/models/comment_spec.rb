require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    @post=Post.create
  end

  it "is valid with valid attributes" do
    expect(@post.comments.new).to be_valid
  end

end
