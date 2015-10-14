require_relative 'card'

puts "Enter file name"
file = gets.chomp
customer_accounts = []

File.open(file).each_line do |line|
  line.strip!
  line = line.downcase!.split(' ')

  case line[0]
  when 'add'
    raise ArgumentError.new('Invalid inputs') unless line[1] && line[2] && line[3]

    card = Card.new(name: line[1].capitalize!,
                    card_num: line[2],
                    limit: line[3][1..-1].to_i)
    customer_accounts << card
    p customer_accounts
  when 'charge'

  when 'credit'

  end
end


# case line[0]
# when 'ADD'

