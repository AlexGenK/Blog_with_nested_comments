require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    it "assigns array of posts to @posts"
    it "renders the index template"
  end
  
  describe "GET show" do
    it "assigns the requested post to @post"
    it "renders the show template"
  end
  
  describe "GET new" do
    it "assigns a new post to @post"
    it "renders the new template"
  end
  
  describe "POST create" do
    context "with valid attributes" do
      it "saves the new post in the database"
      it "redirects to the home page"
    end
    
    context "with invalid attributes" do
      it "does not save the new post in the database"
      it "re-renders the new template"
    end
  end
end
