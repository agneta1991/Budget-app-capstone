require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) do
    User.create(id: 112, name: 'Agneta', surname: 'Pupienyte', email: 'agneta@agneta.com', password: 'password')
  end

  let(:group) do
    Group.create(id: 1002, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: 112)
  end

  let(:entity) do
    Entity.create(id: 147_852, name: 'Entertainment', amount: 2.5, author_id: user.id, group_id: group.id)
  end

  it 'is not valid with empty name' do
    group = Group.create(id: 120, name: '', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
    expect(group).to_not be_valid
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is not valid if name is empty' do
    user = User.create(id: 7_410_258, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 8_520_963, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
    entity = Entity.create(id: 147_852, name: '', amount: 2.5, author_id: user.id, group_id: group.id)
    expect(entity).to_not be_valid
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without name' do
    user = User.create(id: 75_321, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 75_369, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
    entity = Entity.create(id: 95_123, author_id: user.id, group_id: group.id)
    expect(entity).to_not be_valid
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'is not valid if amount is negative number' do
    user = User.create(id: 7_854_129, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 95_145, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
    entity = Entity.create(id: 202_003, name: 'Theater', amount: -2, author_id: user.id, group_id: group.id)
    expect(entity).to_not be_valid
    expect(entity.errors[:amount]).to include('must be greater than or equal to 0')
  end

  it 'is not valid if amount is a string' do
    user = User.create(id: 963_000, email: 'agneta@agneta.com', name: 'Agneta', surname: 'Pupienyte', password: 'password')
    group = Group.create(id: 963_011, name: 'Entertainment', icon: 'https://img.icons8.com/ios/50/f08080/theatre-mask.png', user_id: user.id)
    entity = Entity.create(id: 7_400_221, name: 'Theater', amount: 'two', author_id: user.id, group_id: group.id)
    expect(entity).to_not be_valid
    expect(entity.errors[:amount]).to include('is not a number')
  end
end
