require_relative 'card'

class Parse
  attr_reader :line_arr

  def initialize(line)
    @line_arr = line.split(' ')
  end

  def command
    line_arr[0]
  end

  def name
    line_arr[1].capitalize
  end

  def card_num
    line_arr[2].to_i
  end

  def limit
    line_arr[-1].delete('$').to_i
  end

  def amount
    line_arr[-1].delete('$').to_i
  end

end

puts "Enter file name"
file = gets.chomp
customer_accounts = {}

File.open(file).each_line do |line|
  line.strip!
  line.downcase!
  parser = Parse.new(line)

  case parser.command

  when 'add'
    raise ArgumentError.new('Invalid inputs') unless parser.command && parser.name && parser.limit
    card_num = parser.card_num
    validator = LuhnValidator.new(card_num)

    if validator.luhn_check
      card = Card.new(name: parser.name, card_num: parser.card_num, limit: parser.limit)
      customer_accounts[card.name] = card
    else
      # if it fails luhn, card_num is not assigned (nil)
      card = Card.new(name: parser.name)
      customer_accounts[card.name] = card
    end

  when 'charge'
    card = customer_accounts[parser.name]
    card.charge(parser.amount) if card.card_num

  when 'credit'
    card = customer_accounts[parser.name]
    card.credit(parser.amount) if card.card_num
  end

end

p customer_accounts


# case line[0]
# when 'ADD'

