require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  context 'page' do
    before(:each) do
      User.destroy_all
      visit new_user_session_path
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      sleep(1)
    end

    it 'should display groups#index view' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'should display a Add_a_new_category button' do
      expect(page).to have_content('Add a new category')
    end

    it 'when clicks on Add_a_new_category button, it redirects to new_category page' do
      click_button 'Add a new category'
      sleep(1)

      expect(page).to have_current_path(new_group_path)
    end
  end
end
