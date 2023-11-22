require 'rails_helper'

RSpec.describe User, type: :feature do
  let(:user) { build(:user) }

  describe 'GET /index' do
    it 'displays login content' do
      visit root_path
      expect(page).to have_content('LOG IN')
      expect(page).to have_content('SIGN UP')
    end

    it 'displays links' do
      visit root_path
      expect(page).to have_link('SIGN UP')
      expect(page).to have_link('LOG IN')
    end

    it 'displays a logo' do
      visit root_path
      expect(page).to have_css('img', minimum: 1)
    end
  end
end
