require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create(id: 112, name: 'Agneta', surname: 'Pupienyte', email: 'agneta@agneta.com', password: 'password')
  end
  let(:group) do
    Group.create(id: 1002, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png',
                 user_id: 112)
  end

  it 'is not valid with empty name' do
    user = User.create(id: 41, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 120, name: '', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png',
                         user_id: user.id)
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is not valid with empty icon' do
    user = User.create(id: 41, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 120, name: 'Entertainment', icon: '', user_id: user.id)
    expect(group.errors[:icon]).to include("can't be blank")
  end

  it 'icon has to start with https' do
    user = User.create(id: 41, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 120, name: 'Entertainment', icon: 'www.example.png', user_id: user.id)
    expect(group.errors[:icon]).to include('It must have a valid format (https:// .png or .jpg)')
  end

  it 'icon has to start with https' do
    user = User.create(id: 41, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 120, name: 'Entertainment', icon: 'https://example.com', user_id: user.id)
    expect(group.errors[:icon]).to include('It must have a valid format (https:// .png or .jpg)')
  end
end
