require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe "GET index" do
    it "assigns array of posts to @posts" do
      post_one = create(:post)
      get :index
      expect(assigns(:posts)).to match_array([post_one])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET show" do
    it "assigns the requested post to @post"
    it "renders the show template" do
    end
  end
  
  describe "GET new" do
    it "assigns a new post to @post"
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
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
