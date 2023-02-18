require 'rails_helper'

RSpec.describe User, type: :model do
  context 'is created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
    end

    it 'should have a name' do
      expect(@user.name).to eq('User')
    end

    it 'should have an email' do
      expect(@user.email).to eq('user@example.com')
    end

    it 'should have an email' do
      expect(@user.password).to eq('123456')
    end
  end

  context 'is not created correctly' do
    it 'if has no name' do
      @user = User.create(email: 'user@example.com', password: '123456')
      expect(@user).to_not be_valid
    end

    it 'if has no email' do
      @user = User.create(name: 'User', password: '123456')
      expect(@user).to_not be_valid
    end

    it 'if has no password' do
      @user = User.create(name: 'User', email: 'user@example.com')
      expect(@user).to_not be_valid
    end

    it 'if name is longer than 250 chars' do
      username = 'a' * 251
      @user = User.create(name: username, email: 'user@example.com', password: '123456')
      expect(@user).to_not be_valid
    end
  end
end
