require 'rails_helper'

RSpec.describe 'splash page', type: :system do
  describe 'Splash root page' do
    before do
      visit root_path
    end

    scenario 'displays the Budget Buddy header' do
      expect(page).to have_content('Budget Buddy')
    end

    scenario 'contains LOG IN and SIGN UP links' do
      expect(page).to have_link('LOG IN', href: new_user_session_path)
      expect(page).to have_link('SIGN UP', href: new_user_registration_path)
    end

    scenario 'redirects to the LOG IN page' do
      click_link 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end

    scenario 'redirects to the SIGN UP page' do
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
