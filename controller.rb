require_relative './model/parse'

def display(accounts)
  sorted_accounts = Hash[accounts.sort]
  puts '**********'
  puts
  sorted_accounts.each_value do |card|
    if card.card_num
      puts "#{card.name}: $#{card.balance}"
    else
      puts "#{card.name}: error"
    end
  end
  puts
  puts '**********'
end

puts "Enter file name"
file = gets.chomp
customer_accounts = {}

File.open(file).each_line do |line|
  line.strip!
  line.downcase!
  parser = Parser.new(line)

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

display(customer_accounts)
