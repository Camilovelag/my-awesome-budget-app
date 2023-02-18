require 'rails_helper'

RSpec.describe 'Splash', type: :feature do
  context 'page' do
    before(:each) do
      visit root_path
    end

    it 'shows the app name' do
      expect(page).to have_content('My awesome budget app')
    end

    it 'shows a log_in button' do
      expect(page).to have_content('LOG IN')
    end

    it 'shows a sign_up button' do
      expect(page).to have_content('SIGN UP')
    end

    it 'when clicks log_in button, redirects user to log_in page' do
      click_button 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'when clicks sign_up button, redirects user to sign_up page' do
      click_button 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
