require 'rails_helper'

describe "the signin process",  type: :system do
  before(:each) do
    Capybara.current_driver = :selenium_chrome_headless
  end
  let!(:user) { create(:user) }
  context 'an existing user is able to login' do
    it 'tries something' do
      visit('/')
      click_link('Login', href:  new_user_session_path)
      within('#login') do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button('Login')
      end
      expect(page).to have_content("Dashboard")
    end
  end
end
