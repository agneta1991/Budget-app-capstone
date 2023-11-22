require 'rails_helper'

RSpec.describe User, type: :request do
  let(:user) do
    User.create(id: 2, name: 'Agneta', surname: 'Pupienyte', email: 'agneta@agneta.com', password: 'password')
  end

  describe 'GET /index' do
    before do
      get users_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<a class="login" href="/users/sign_in">LOG IN</a>')
    end
  end
end
