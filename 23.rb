class Integer
  def divisors
    (2..Math.sqrt(self).floor).map { |d| [d, self/d] if self % d == 0 }.compact.flatten.uniq << 1
  end

  def abundant?
    self < divisors.inject(:+)
  end
end

abundant = (1..28123).select(&:abundant?)

sums = []
abundant.each_with_index do |a,i|
  abundant[i...abundant.size].each do |b|
    break if (sum = a + b) > 28123
    sums << sum
  end
end

puts ((1..28123).to_a - sums.uniq!).inject(:+)
