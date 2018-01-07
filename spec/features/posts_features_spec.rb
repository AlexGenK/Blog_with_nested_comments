require 'rails_helper'

feature 'Access to posts', type: :feature do
  before do 
    @article=create(:article_from_user_one)
    @event=create(:event_from_user_two)
    @user=build(:user_one)
    visit root_path
  end

  context 'when Visitor is logged out' do
    scenario 'Visitor is viewing posts index' do
      expect(page).to have_content 'List of posts'
      expect(page).to have_content @article.title
      expect(page).to have_content @event.title
      expect(page).to have_selector('article', count: 2)
    end

    scenario 'Visitor is viewing start date for event' do
      expect(page).to have_content "start at: #{@event.date}"
    end

    scenario 'Visitor is viewing post' do
      click_link @event.title
      expect(page).to have_content @event.body
      expect(page).to have_content @event.title
      expect(page).to_not have_content @article.title
      expect(page).to_not have_content 'List of posts'
    end

    scenario 'Visitor can not add post' do
      click_link '>>> Create new post <<<'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end

    scenario 'Visitor can not edit post' do
      click_link @event.title
      click_link '>>> Edit'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end

    scenario 'Visitor can not delete post' do
      click_link @event.title
      click_link 'Delete <<<'
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end

    scenario 'Visitor can do Sign up' do
      click_link 'Log In'
      expect(page).to have_content 'Remember me'
      click_link 'Sign up'
      expect(page).to have_content 'Sign up'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password
      click_button 'Sign up'
      expect(page).to have_content 'You have signed up successfully'
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

    scenario 'Visitor can add post with correct params' do
      click_link '>>> Create new post <<<'
      fill_in 'Title', with: @article.title
      fill_in 'Body', with: @article.body
      click_button 'Create Post'
      click_link 'Show all posts'
      expect(page).to have_selector('article', count: 3)
    end

    scenario 'Visitor can add post/event with correct params' do
      click_link '>>> Create new post <<<'
      choose 'post_kind_event'
      fill_in 'post_date', with: @event.date
      fill_in 'Title', with: @event.title
      fill_in 'Body', with: @event.body
      click_button 'Create Post'
      click_link 'Show all posts'
      expect(page).to have_selector('article', count: 3)
      expect(page).to have_content('start at:', count: 2)
    end

    scenario 'Visitor can not add post with empty title' do
      click_link '>>> Create new post <<<'
      fill_in 'Title', with: nil
      fill_in 'Body', with: @article.body
      click_button 'Create Post'
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content 'Add new post'
    end

    scenario 'Visitor can not add post with empty body' do
      click_link '>>> Create new post <<<'
      fill_in 'Title', with: @article.title
      fill_in 'Body', with: nil
      click_button 'Create Post'
      expect(page).to have_content "Body can't be blank"
      expect(page).to have_content 'Add new post'
    end

    scenario 'Visitor can not add post/event with incorrect date' do
      click_link '>>> Create new post <<<'
      choose 'post_kind_event'
      fill_in 'post_date', with: 1.day.ago
      fill_in 'Title', with: @event.title
      fill_in 'Body', with: @event.body
      click_button 'Create Post'
      expect(page).to have_content 'Date must be on or after'
      expect(page).to have_content 'Add new post'
    end

    scenario 'Visitor can delete his post' do
      click_link @article.title
      click_link 'Delete <<<'
      expect(page).to have_selector('article', count: 1)
      expect(page).to_not have_content @article.title
    end

    scenario 'Visitor can edit his post' do
      click_link @article.title
      click_link '>>> Edit'
      fill_in 'Title', with: "#{@article.title} edit"
      click_button 'Update Post'
      expect(page).to have_content "#{@article.title} edit"
    end

    scenario "Visitor can not delete someone else's post" do
      click_link @event.title
      click_link 'Delete <<<'
      expect(page).to have_content 'Only the user who created the post, can delete or edit it'
      click_link 'Show all posts'
      expect(page).to have_selector('article', count: 2)
    end

    scenario "Visitor can not edit someone else's post" do
      click_link @event.title
      click_link '>>> Edit'
      expect(page).to have_content 'Only the user who created the post, can delete or edit it'
      click_link 'Show all posts'
      expect(page).to have_selector('article', count: 2)
    end

    scenario "Visitor can do Sign out" do
      click_link 'Log Out'
      expect(page).to have_content 'Signed out successfully'
      expect(page).to have_selector('article', count: 2)
    end
  end
end