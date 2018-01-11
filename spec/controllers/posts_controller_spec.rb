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
    before do 
      @user = create(:user_one)
      sign_in @user
    end

    it "assign a new instance of Post class with current date to @post" do
      get :new
      expect(assigns(:post).instance_of?(Post)).to be_truthy
      expect(assigns(:post)[:date]).to eq(Time.now.to_date)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end