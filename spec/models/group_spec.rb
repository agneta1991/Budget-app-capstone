require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is not valid with valid attributes' do
    user = User.create(id: 1001, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 1002, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png')
    expect(group).to_not be_valid
  end

  it 'is not valid with valid attributes' do
    user = User.create(id: 10_741, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte',
                       password: 'password')
    group = Group.create(id: 185_220, name: '', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png',
                         user_id: user.id)
    expect(group).to_not be_valid
  end

  it 'is not valid with valid attributes' do
    user = User.create(id: 1963, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 185_213, name: 'Entertainment', icon: '',
                         user_id: user.id)
    expect(group).to_not be_valid
  end
end
