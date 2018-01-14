require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "GET #new" do
    before do 
      sign_in create(:user_one)
      @post = create(:article_from_user_one)
    end

    it "assign a new instance of Comment class to @comment" do
      get :new, params: { post_id: @post.id }
      expect(assigns(:comment).instance_of?(Comment)).to be_truthy
    end

    it "renders the new template" do
      get :new, params: { post_id: @post.id }
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    before do 
      sign_in create(:user_one)
      @post = create(:article_from_user_one)
    end

    context "with valid attributes" do
      subject { post :create, params: { post_id: @post.id, comment: attributes_for(:comment_for_post) } }

      it "creates a new comment" do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it "redirect to the show of parent @post" do
        expect(subject).to redirect_to(@post)
      end
    end

    context "with invalid attributes" do
      subject { post :create, params: { post_id: @post.id, comment: attributes_for(:comment_for_post, body: nil) } }

      it "does not save the new post" do
        expect { subject }.to_not change(Comment, :count)
      end

      it "re-render the new method" do
        expect(subject).to render_template("new")
      end
    end
  end
end
