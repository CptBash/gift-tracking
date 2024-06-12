# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friend, type: :model do
  context 'validation tests' do
    before(:all) do
      # create user for createing friends
      @user = User.create(email: 'chuck_testa@test.com', password: 'password')
    ends

    it 'ensures user presence' do
      friend = Friend.new(name: 'Test', birthday: '2022-01-01').save
      expect(friend).to eq(false)
    end

    it 'ensures name presence' do
      friend = Friend.new(name: nil, birthday: '2022-01-01', user_id: @user.id).save
      expect(friend).to eq(false)
    end

    it 'ensures birthday presence' do
      friend = Friend.new(name: 'Test', user_id: @user.id).save
      expect(friend).to eq(false)
    end
  end

  context 'CRUD tests' do
    let(:params) { { name: 'Test', birthday: '2022-01-01' } }

    it 'can create a friend' do
      expect { Friend.create(params) }.to change { Friend.count }.by(1)
    end

    it 'can update a friend' do
      friend = Friend.create(params)
      friend.update(name: 'Updated')
      expect(friend.name).to eq('Updated')
    end

    it 'can delete a friend' do
      friend = Friend.create(params)
      expect { friend.destroy }.to change { Friend.count }.by(-1)
    end
  end
end
