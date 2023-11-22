require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  let(:user) do
    User.create(id: 2, name: 'Agneta', surname: 'Pupienyte', email: 'agneta@agneta.com', password: 'password')
  end

  describe 'GET /index' do
    before do
      sign_in user
      Group.create(id: 101, name: 'Entertainment',
                   icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
      visit groups_path
    end

    it 'has atributes' do
      expect(page).to have_selector('nav')
      expect(page).to have_selector('div')
      expect(page).to have_selector('footer')
    end

    it 'shows group name' do
      expect(page).to have_content('Entertainment')
    end

    it 'shows group name' do
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
