class Integer
  def divisors
    (2..Math.sqrt(self).floor).map { |d| [d, self/d] if self % d == 0 }.compact.flatten.uniq << 1
  end

  def sum_divisors
    divisors.inject(:+)
  end
end

puts (3..9999).select { |n|
  sum = n.sum_divisors
  sum != 1 && sum != n && n == sum.sum_divisors
}.inject(:+)
