require_relative 'validate'

class Card
  attr_reader :name, :limit, :card_num

  def initialize(args={})
    @name = args[:name]
    @card_num = args[:card_num]
    @limit = args[:limit]
    @balance = 0
  end

  def charge(amt)
    @balance += amt if @balance + amt <= limit
  end

  def credit(amt)
    @balance -= amt
  end



end