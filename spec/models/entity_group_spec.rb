require 'rails_helper'

RSpec.describe EntityGroup, type: :model do
  context 'is created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
      @entity = Entity.create(name: 'Transaction', amount: 10.50, author_id: @user.id)
      @group = Group.create(name: 'Group', icon: nil, user_id: @user.id)
      @entity_group = EntityGroup.create(entity_id: @entity.id, group_id: @group.id)
    end

    it 'should have a group' do
      expect(@entity_group.group_id).to eq(@group.id)
    end

    it 'should have an entity' do
      expect(@entity_group.entity_id).to eq(@entity.id)
    end
  end

  context 'is not created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
      @entity = Entity.create(name: 'Transaction', amount: 10.50, author_id: @user.id)
      @group = Group.create(name: 'Group', icon: nil, user_id: @user.id)
    end

    it 'if has no group' do
      @entity_group = EntityGroup.create(entity_id: @entity.id)
      expect(@entity_group).to_not be_valid
    end

    it 'if has no entity' do
      @entity_group = EntityGroup.create(group_id: @group.id)
      expect(@entity_group).to_not be_valid
    end
  end
end
