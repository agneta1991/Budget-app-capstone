require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  let(:user) do
    User.create(id: 2, name: 'Agneta', surname: 'Pupienyte', email: 'agneta@agneta.com', password: 'password')
  end

  describe 'GET /new' do
    before do
      sign_in user
      Group.create(id: 102, name: 'Entertainment',
                   icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
      visit new_group_path
    end

    it 'has a atributes' do
      expect(page).to have_selector('nav')
    end

    it 'shows group name' do
      expect(page).to have_content('Add your category')
    end

    it 'should have navigation bar content' do
      expect(page).to have_content('SIGN OUT')
      expect(page).to have_content('CATEGORY')
    end
  end
end
