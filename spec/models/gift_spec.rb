require 'rails_helper'

RSpec.describe Gift, type: :model do
  before(:all) do
    friend = Friend.create!(name: 'Name', birthday: '2022-01-01')
  end
  context 'validation tests' do
    it 'ensures name presence' do
      gift = Gift.new(name: 'Test', friend_id: 1).save
      expect(gift).to eq(true)
    end

    it 'ensures friend presence' do
      gift = Gift.new(name: 'Test').save
      expect(gift).to eq(false)
    end
  end

  context 'CRUD tests' do
    let(:params) { { name: 'Test', friend_id: 1 } }

    it 'can create a gift' do
      expect { Gift.create(params) }.to change { Gift.count }.by(1)
    end

    it 'can update a gift' do
      gift = Gift.create(params)
      gift.update(name: 'Updated')
      expect(gift.name).to eq('Updated')
    end

    it 'can delete a gift' do
      gift = Gift.create(params)
      expect { gift.destroy }.to change { Gift.count }.by(-1)
    end
  end
end
