require 'rails_helper'

RSpec.describe Group, type: :request do
  let(:user) do
    User.create(id: 2, name: 'Agneta', surname: 'Pupienyte', email: 'agneta@agneta.com', password: 'password')
  end

  describe 'GET /index' do
    before do
      sign_in user
      get groups_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include("<div class='groups'>")
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_group_path
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('new')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include("<p class = 'add_category'> Add your category </p>")
    end
  end

  describe 'POST /create' do
    before do
      sign_in user
      get groups_path
    end

    it 'creates a new group' do
      expect do
        post groups_path, params: { group: { name: 'Example group', user_id: 2, icon: 'www.example.com' } }
        expect(Group.count).to eq(1)
      end
    end

    it 'redirects to groups_path' do
      expect do
        post groups_path, params: { group: { name: 'Example group', user_id: 2, icon: 'www.example.com' } }
        expect(response).to redirect_to(groups_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @user_group = Group.create(id: 7, name: 'Entertainment', icon: 'www.example.com', user_id: 2)
      sign_in user
    end

    it 'destroys the requested group' do
      expect do
        delete groups_path(@user_group)
        expect(Group.count).to change(-1)
      end
    end

    it 'redirects to the groups' do
      expect do
        delete groups_path(@user_group)
        expect(response).to redirect_to(groups_path)
      end
    end
  end
end
