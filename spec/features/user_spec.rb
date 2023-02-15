require 'rails_helper'

RSpec.describe 'User', type: :feature do
  context 'sign up' do
    before(:each) do
      User.destroy_all
      visit new_user_registration_path
    end

    it 'should display a sign_up page' do
      expect(page).to have_content('Sign up')
    end

    it 'should allow user to register in the app' do
      fill_in 'Username', with: 'User'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_button 'Sign up'
      sleep(1)

      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(page).to have_current_path(groups_path)
    end
  end

  context 'log in' do
    before(:each) do
      User.destroy_all
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
      visit new_user_session_path
    end

    it 'should display a log_in page' do
      expect(page).to have_content('Log in')
    end

    it 'should allow user to log into the app' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      sleep(1)

      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path(groups_path)
    end
  end

  context 'not registered/logged in users' do
    before(:each) do
      User.destroy_all
    end

    it 'could not access categories page' do
      visit groups_path
      expect(page).not_to have_current_path(groups_path)
    end
  end
end
