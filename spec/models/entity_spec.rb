require 'rails_helper'

RSpec.describe Entity, type: :model do
  context 'is created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
      @entity = Entity.create(name: 'Transaction', amount: 10.50, author_id: @user.id)
    end

    it 'should have a name' do
      expect(@entity.name).to eq('Transaction')
    end

    it 'should have an amount' do
      expect(@entity.amount).to eq(10.50)
    end

    it 'should have an author' do
      expect(@entity.author_id).to eq(@user.id)
    end
  end

  context 'is not created correctly' do
    before(:all) do
      @user = User.create(name: 'User', email: 'user@example.com', password: '123456')
    end

    it 'if has no name' do
      @entity = Entity.create(amount: 10.50, author_id: @user.id)
      expect(@entity).to_not be_valid
    end

    it 'if has no amount' do
      @entity = Entity.create(name: 'Transaction', author_id: @user.id)
      expect(@entity).to_not be_valid
    end

    it 'if has no user' do
      @entity = Entity.create(name: 'Transaction', amount: 10.50)
      expect(@entity).to_not be_valid
    end

    it 'if amount is not a decimal' do
      @entity = Entity.create(name: 'Transaction', amount: 'amount', author_id: @user.id)
      expect(@entity).to_not be_valid
    end

    it 'if amount is lower than zero' do
      @entity = Entity.create(name: 'Transaction', amount: -1, author_id: @user.id)
      expect(@entity).to_not be_valid
    end

    it 'if amount is higher than 10^6' do
      @entity = Entity.create(name: 'Transaction', amount: 10 ^ 7, author_id: @user.id)
      expect(@entity).to_not be_valid
    end
  end
end
