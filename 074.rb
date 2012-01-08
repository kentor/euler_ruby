require 'set'

class Integer
  def !
    return 1 if self < 2
    (2..self).inject(:*)
  end

  Factorials = (0..9).map(&:!)

  def digit_factorial(q = self, sum = 0)
    return 1 if self == 0
    until q == 0
      q, r = q / 10, q % 10
      sum += Factorials[r]
    end
    sum
  end

  def factorial_chain_size(n = self, count = 0, set = Set.new)
    begin
      set << n
      n, count = n.digit_factorial, count + 1
    end until set.include?(n)
    count
  end

  def _60?
    self.factorial_chain_size == 60
  end

  def count_forms(digits = self.to_s.chars.map(&:to_i))
    numerator   = (digits.count - digits.count(0)) * Factorials[digits.count-1]
    denominator = (0..9).inject(1) { |prod, n| prod * Factorials[digits.count(n)] }
    numerator / denominator
  end
end

puts (1..6).map { |digits|
  (0..9).to_a.reverse.repeated_combination(digits).map { |a| a.join.to_i }.select(&:_60?)
}.flatten.map(&:count_forms).inject(:+)
