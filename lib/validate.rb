class LuhnValidator

  attr_reader :card_num_str,:card_num_arr, :sum_odd, :sum_even
  MAX_LENGTH = 19

  def initialize(card_num_str)
    @card_num_str = card_num_str
    @card_num_arr = convert_num_to_array(@card_num_str)
    @sum_odd = sum_odd_arr(@card_num_arr)
    @sum_even = sum_even_arr(@card_num_arr)
  end

  def convert_num_to_array(num_str)
    num_str.split('')
  end

  # Index starts from 1 (different from conventional array index)
  def get_odd_arr(arr)
    arr.values_at(*arr.each_index.select{|index| index.even?})
  end

  def get_even_arr(arr)
    arr.values_at(*arr.each_index.select{|index| index.odd?})
  end

  def sum_odd_arr(arr)
    odd_arr = get_odd_arr(arr.reverse)
    odd_arr.map {|str| str.to_i}.reduce(:+)
  end

  def sum_even_arr(arr)
    sum_arr = []
    even_arr = get_even_arr(arr.reverse)
    double(even_arr).each do |element|
      element = split_add(element) if element > 9
      sum_arr << element
    end
    sum_arr.reduce(:+)
  end

  def double(arr)
    arr.map {|str| str.to_i*2}
  end

  def split_add(num)
    num[0] + num[1]
  end

  def luhn_check
    (sum_odd + sum_even) % 10 == 0 && card_num_str.length <= 19
  end

end

