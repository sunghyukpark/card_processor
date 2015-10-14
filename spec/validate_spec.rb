require 'rspec'
require_relative '../lib/validate'


describe LuhnValidator do

  let(:num) {LuhnValidator.new('1234')}
  let(:arr) {[1,2,3,4]}

  describe '.convert_num_to_array' do
    it 'converts number into array' do
      expect(num.card_num_arr).to eq(['1','2','3','4'])
    end
  end

  describe '.get_odd_arr' do
    it 'returns new array of elements with odd index' do
      expect(num.get_odd_arr(arr)).to eq([1,3])
    end
  end

  describe '.get_even_arr' do
    it 'returns new array of elements with even index' do
      expect(num.get_even_arr(arr)).to eq([2,4])
    end
  end

  # odd sum & even sum for luhn10 in README
  describe '.sum_odd_arr' do
    it 'returns odd sum for luhn10 check' do
      expect(num.sum_odd_arr(arr)).to eq(6)
    end
  end

  describe '.sum_even_arr' do
    it 'returns even sum for luhn10 check' do
      expect(num.sum_even_arr(arr)).to eq(8)
    end
  end

  describe '.double' do
    it 'doubles every element of array' do
      expect(num.double(arr)).to eq([2,4,6,8])
    end
  end

  describe '.luhn_check' do
    it 'modulo operates 10 on total sum of even_sum and odd_sum and check the length' do
      expect(num.luhn_check).to eq(false)
    end
  end

end