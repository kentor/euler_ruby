class Integer
  @@squares = (0..9).map { |n| n*n }

  def sum_square_digits(n = self, sum = 0)
    until n == 0
      n, r = n.divmod(10)
      sum += @@squares[r]
    end
    sum
  end

  @@cache = [nil] * 568

  (1..567).each do |n|
    seq = n
    seq = seq.sum_square_digits until seq == 1 || seq == 89
    @@cache[n] = (seq == 1 ? nil : true)
  end

  def _89?(n = self)
    return @@cache[n.sum_square_digits]
  end
end

puts (2...10000000).count(&:_89?)
