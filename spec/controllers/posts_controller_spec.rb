require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "assigns array of posts to @posts" do
       post = create(:post_from_user_one)
       get :index
       expect(assigns(:posts)).to eq([post])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before { @post = create(:post_from_user_one) }
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
      sign_in create(:user_one)
    end

    it "assign a new instance of Post class" do
      get :new
      expect(assigns(:post).instance_of?(Post)).to be_truthy
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    before do 
      sign_in create(:user_one)
    end

    context "with valid attributes" do
      subject { post :create, params: { post: attributes_for(:post_from_user_one) } }

      it "creates a new post" do
        expect { subject }.to change(Post, :count).by(1)
      end

      it "redirect to the show of new post" do
        expect(subject).to redirect_to(Post.last)
      end
    end

    context "with invalid attributes" do
      subject { post :create, params: { post: attributes_for(:post_from_user_one, body: nil) } }

      it "does not save the new post" do
        expect { subject }.to_not change(Post, :count)
      end

      it "re-render the new method" do
        expect(subject).to render_template("new")
      end
    end
  end

  describe "POST #update" do
    before do 
      sign_in create(:user_one)
      @post = create(:post_from_user_one)
    end

    context "with valid attributes" do
      subject { put :update, params: { id: @post, post: attributes_for(:post_from_user_one, title: 'Updated', body: 'Test') } }

      it "changes @post attributes" do
        subject
        @post.reload
        expect(@post.title).to eq('Updated')
        expect(@post.body).to eq('Test')
      end

      it "redirect to updated @post" do
        expect(subject).to redirect_to(@post) 
      end
    end

    context "with invalid attributes" do
      subject { put :update, params: { id: @post, post: attributes_for(:post_from_user_one, title: 'Update', body: nil) } }

      it "does not change @post's attributes" do
        subject
        @post.reload
        expect(@post.title).to eq(attributes_for(:post_from_user_one)[:title])
        expect(@post.body).to eq(attributes_for(:post_from_user_one)[:body])
      end

      it "re-render the edit method" do
        subject
        expect(subject).to render_template("edit")
      end
    end
  end

  describe 'DELETE #destroy' do
    before do 
      sign_in create(:user_one)
      @post = create(:post_from_user_one)
    end

    subject { delete :destroy, params: { id: @post }}

    it 'deletes the @post' do
      expect { subject }.to change(Post, :count).by(-1)
    end

    it "redirects to contacts#index" do
      subject
      expect(subject).to redirect_to(Post)
    end
  end
end
