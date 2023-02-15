require 'rails_helper'

RSpec.feature "Splash", type: :feature do
  before(:each) do
    visit root_path
  end

  it 'shows the app name' do
    visit root_path
    expect(page).to have_content('My awesome budget app')
  end
end
