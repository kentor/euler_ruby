class Integer
  def divisors
    (2..Math.sqrt(self).floor).map { |d| [d, self/d] if self % d == 0 }.compact.flatten.uniq << 1
  end

  def sum_divisors
    divisors.inject(:+)
  end
end

puts (3..9999).select { |n|
  pair = n.sum_divisors
  pair != 1 && pair != n && pair.sum_divisors == n
}.inject(:+)
