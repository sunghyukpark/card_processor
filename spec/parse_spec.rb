require 'rspec'
require_relative '../model/parse'

describe Parser do

  let(:parse) {Parser.new('Add tom 1234 $1000')}

  context 'initialize' do
    it 'creates an array of input' do
      expect(parse.line_arr).to be_a(Array)
    end
  end

  context 'modifies input line' do
    it 'selects command' do
      expect(parse.command).to eq('Add')
    end

    it 'selects name and capitalize it' do
      expect(parse.name).to eq('Tom')
    end

    it 'selects card number and converts it to string' do
      expect(parse.card_num).to eq(1234)
    end

    it 'selects card limit, deletes dollar sign and convert to integer' do
      expect(parse.limit).to eq(1000)
    end

    it 'selects card limit, deletes dollar sign and convert to integer' do
      expect(parse.amount).to eq(1000)
    end
  end

end
