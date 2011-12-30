class Integer
  def divisors
    (2..Math.sqrt(self).floor).map { |d| [d, self/d] if self % d == 0 }.compact.flatten.uniq.push(1)
  end

  def sum_divisors
    divisors.inject(:+)
  end

  def abundant?
    self < sum_divisors
  end
end

abundant = (1..28123).select(&:abundant?)

sums = []
abundant.each_with_index do |v, i|
  (i...abundant.size).each do |j|
    break if (sum = v + abundant[j]) > 28123
    sums << sum
  end
end
sums = sums.uniq.sort

keep = []
(1..28123).each { |a| a != sums.first ? keep << a : sums.shift }

puts keep.inject(:+)
