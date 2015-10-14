require_relative 'validate'

class Card
  attr_reader :name

  def initialize(args={})
    @name = args[:name]
    @card_num = args[:card_num]
    @limit = args[:limit]
    @balance = 0
  end

  def credit

  end

  def charge
  end
end