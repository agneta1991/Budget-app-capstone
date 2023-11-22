require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    user = User.create(id: 100, email: 'agneta1@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    expect(user).to be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(id: 200, email: '', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is valid with valid attributes' do
    user = User.create(id: 300, email: 'agneta2@agneta.com', name: '', surname: 'Pupienyte', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is valid with valid attributes' do
    user = User.create(id: 400, email: 'agneta3@agneta.com', name: 'Agneta', surname: '', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is valid with valid attributes' do
    user = User.create(id: 500, email: 'agneta4@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: '')
    expect(user).to_not be_valid
  end
end
