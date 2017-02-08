class CreditCheck
  attr_reader :card_number, :total
  def initialize(card_number)
    @card_number = card_number.reverse
    @total = 0
  end

  def checker
    return modulo_validator(number_iterator)
  end

  def number_iterator
    @card_number.length.times do |num|
      @total += even_odd_checker(num)
    end
    return @total
  end

  def even_odd_checker(num)
    if num.odd?
      return sum_value_greater_nine((@card_number[num].to_i)*2)
    else
      return @card_number[num].to_i
    end
  end

  def sum_value_greater_nine(num)
    if num > 9
      return num.to_s[0].to_i + num.to_s[1].to_i
    else
      return num
    end
  end

  def modulo_validator(num)
    num % 10 == 0 ? (return "The number is valid!") : (return "The number is invalid!")
  end

end
