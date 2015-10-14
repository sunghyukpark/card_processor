require_relative 'card'

puts "Enter file name"
file = gets.chomp
customer_accounts = []

File.open(file).each_line do |line|
  line.strip!
  line = line.downcase!.split(' ')
  command = line[0]
  name = line[1]

  case command
  when 'add'
    raise ArgumentError.new('Invalid inputs') unless command && name && line[3]
    validator = LuhnValidator.new(line[2])
    if validator.luhn_check
      card = Card.new(name: name.capitalize!,
                      card_num: line[2],
                      limit: line[3][1..-1].to_i)
      customer_accounts << card
    else
      card = Card.new(name: name.capitalize!)
      customer_accounts << card
    end
    p customer_accounts
  when 'charge'
  when 'credit'

  end
end


# case line[0]
# when 'ADD'

