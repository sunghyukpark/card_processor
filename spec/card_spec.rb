require 'rspec'
require_relative '../model/card'

describe Card do

  let(:card) {Card.new(limit: 1000)}

  context 'when initialized' do
    it 'has balance of zero' do
      expect(card.balance).to eq(0)
    end
  end

  describe '.charge' do
    it 'increases balance by given amount' do
      card.charge(100)
      expect(card.balance).to eq(100)
    end

    it 'does not change balance when amount exceeds limit' do
      card.charge(1100)
      expect(card.balance).to eq(0)
    end
  end

  describe '.credit' do
    it 'decreases balance by given amount' do
      card.credit(100)
      expect(card.balance).to eq(-100)
    end
  end

end