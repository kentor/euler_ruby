class Integer
  DICT = { 1  => "one",     2  => "two",       3  => "three",    4  => "four",     5  => "five",
           6  => "six",     7  => "seven",     8  => "eight",    9  => "nine",     10 => "ten",
           11 => "eleven",  12 => "twelve",    13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
           16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty",
           30 => "thirty",  40 => "forty",     50 => "fifty",    60 => "sixty",    70 => "seventy",
           80 => "eighty",  90 => "ninety",    0  => "" }

  def to_w
    ones = tens = hundreds = thousands = ""
    _ones, _tens, _hundreds, _thousands = self.to_s.reverse.chars.map(&:to_i)

    thousands = DICT[_thousands] + " thousand" if _thousands && _thousands != 0
    hundreds = DICT[_hundreds] + " hundred" if _hundreds && _hundreds != 0

    if _tens == 1
      tens = DICT[10+_ones]
    else
      tens = DICT[10*_tens] if _tens
      ones = DICT[_ones]
    end

    %Q!#{thousands} #{hundreds} #{'and' if self > 100 && (_tens + _ones > 0)} #{tens} #{ones}!.squeeze(' ').strip
  end
end

puts (1..1000).map { |n| n.to_w.tr(' ', '').size }.inject(:+)
