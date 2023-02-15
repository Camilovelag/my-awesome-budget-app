require 'rails_helper'

RSpec.feature 'Splash', type: :feature do
  describe 'page' do
    before(:each) do
      visit root_path
    end

    it 'shows the app name' do
      expect(page).to have_content('My awesome budget app')
    end

    it 'shows a log_in button' do
      expect(page).to have_content('LOG IN')
    end

    it 'redirects user to sign_up page' do
      click_button 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end

    it 'shows a sign_up button' do
      expect(page).to have_content('SIGN UP')
    end

    it 'redirects user to log_in page' do
      click_button 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
