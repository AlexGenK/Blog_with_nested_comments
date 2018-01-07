require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "assigns array of posts to @posts" do
       post = create(:article_from_user_one)
       get :index
       expect(assigns(:posts)).to eq([post])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before { @post = create(:article_from_user_one) }
    it "assigns the requested post to @post" do
      get :show, params: { id: @post }
      expect(assigns(:post)).to eq(@post)
    end

    it "renders the show template" do
      get :show, params: { id: @post }
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assign title, body and kind to the new contact"
  end
end