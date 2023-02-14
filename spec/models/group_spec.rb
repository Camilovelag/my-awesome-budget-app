require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'is created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
      @group = Group.create(name: 'Group', icon: 'https://www.icon.com', user_id: @user.id)
    end

    it 'should have a name' do
      expect(@group.name).to eq('Group')
    end

    it 'should have an icon url' do
      expect(@group.icon).to eq('https://www.icon.com')
    end

    it 'should have an user' do
      expect(@group.user_id).to eq(@user.id)
    end
  end

  context 'is not created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
    end

    it 'if has no name' do
      @group = Group.create(icon: 'https://www.icon.com', user_id: @user.id)
      expect(@group).to_not be_valid
    end

    it 'if has no icon' do
      @group = Group.create(name: 'Group', user_id: @user.id)
      expect(@group).to_not be_valid
    end

    it 'if has no user' do
      @group = Group.create(name: 'Group', icon: 'https://www.icon.com')
      expect(@group).to_not be_valid
    end

    it 'if name is longer than 250 chars' do
      group_name = 'a' * 251
      @group = Group.create(name: group_name, icon: 'https://www.icon.com', user_id: @user.id)
      expect(@group).to_not be_valid
    end
  end
end
