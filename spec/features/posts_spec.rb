require 'rails_helper'

feature 'Access to posts', type: :feature do
  before do 
    @article=create(:post_article)
    @event=create(:post_event)
    visit root_path
  end

  context 'when logged out.' do
    scenario 'Visitor is viewing posts index' do
      expect(page).to have_content 'List of posts'
      expect(page).to have_content @article.title
      expect(page).to have_content @event.title
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

    scenario 'Visitor can log In' do
      click_link 'Log In'
      expect(page).to have_content 'Remember me'
    end
  end

end