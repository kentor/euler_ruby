require 'prime'

class Integer
  def divisors_count
    return 1 if self == 1
    self.prime_division.map { |prime_divisor, exponent| exponent + 1 }.inject(:*)
  end
end

(1..10**10).inject do |t, n|
  if t.divisors_count > 500
    puts t
    break
  end
  t + n
end
