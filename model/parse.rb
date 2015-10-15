require_relative 'card'

class Parser
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


