require 'rails_helper'

feature 'Access to comments', type: :feature do
  before do 
    @comment=create(:comment_for_comment)
    visit root_path
  end

  context 'when Visitor is logged out' do
    scenario 'Visitor is viewing comments index' do
      expect(page).to have_content 'List of posts'
      click_link @comment.post.title
      expect(page).to have_content @comment.body
      expect(page).to have_selector('li', count: 2)
    end

    scenario 'Visitor can not add comment for post' do
      click_link @comment.post.title
      fill_in 'comment_body', with: @comment.body
      click_button 'Create Comment'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end

    scenario 'Visitor can not add comment for comment' do
      click_link @comment.post.title
      click_link '>>> Add a reply', match: :first
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end

  context 'when Visitor is logged in' do
    before do
      @user=create(:user_one)
      click_link 'Log In'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario 'Visitor can add comment for post with correct params' do
      click_link @comment.post.title
      fill_in 'comment_body', with: "#{@comment.body} new"
      click_button 'Create Comment'
      expect(page).to have_content "#{@comment.body} new"
      expect(page).to have_selector('li', count: 3)
    end

    scenario 'Visitor can not add comment for post with empty body' do
      click_link @comment.post.title
      fill_in 'comment_body', with: nil
      click_button 'Create Comment'
      expect(page).to have_content "Body can't be blank"
    end

    scenario 'Visitor can add comment for comment with correct params' do
      click_link @comment.post.title
      click_link '>>> Add a reply', match: :first
      fill_in 'comment_body', with: "#{@comment.body} new"
      click_button 'Create Comment'
      expect(page).to have_content "#{@comment.body} new"
      expect(page).to have_selector('li', count: 3)
    end

    scenario 'Visitor can not add comment for comment with empty body' do
      click_link @comment.post.title
      click_link '>>> Add a reply', match: :first
      fill_in 'comment_body', with: nil
      click_button 'Create Comment'
      expect(page).to have_content "Body can't be blank"
    end
  end
end
