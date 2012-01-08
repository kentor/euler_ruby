class Integer
  def sum_square_digits(q = self, sum = 0)
    return 1 if self == 0
    until q == 0
      q, r = q / 10, q % 10
      sum += r*r
    end
    sum
  end

  Cache = (0..567).map do |n|
    seq = n
    seq = seq.sum_square_digits until seq == 1 || seq == 89
    seq == 89
  end

  def _89?
    return Cache[self.sum_square_digits]
  end

  def !
    return 1 if self < 2
    (2..self).inject(:*)
  end

  Factorials = (0..9).map(&:!)

  def count_forms(digits = self.to_s.chars.map(&:to_i))
    numerator   = (digits.count - digits.count(0)) * Factorials[digits.count-1]
    denominator = (0..9).inject(1) { |prod, n| prod * Factorials[digits.count(n)] }
    numerator / denominator
  end
end

puts (1..7).map { |digits|
  (0..9).to_a.reverse.repeated_combination(digits).map { |a| a.join.to_i }.select(&:_89?)
}.flatten.map(&:count_forms).inject(:+)
