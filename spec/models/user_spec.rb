require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have many appointments' do
      assc = described_class.reflect_on_association(:appointments)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      user = User.new(name: 'ab')
      expect(user).to_not be_valid
    end

    it 'is not valid with a name more than 50 characters' do
      user = User.new(name: 'a' * 51)
      expect(user).to_not be_valid
    end

    it 'is not valid with a name that already exists' do
      @user1 = User.create(name: 'abc')
      @user2 = User.new(name: 'abc')
      expect(@user2).to_not be_valid
    end
  end
end
