class Integer
  def sum_square_digits(q = self, sum = 0)
    until q == 0
      q, r = q / 10, q % 10
      sum += r*r
    end
    sum
  end

  $cache = [false] * 568

  (1..567).each do |n|
    seq = n
    seq = seq.sum_square_digits until seq == 1 || seq == 89
    $cache[n] = true if seq == 89
  end

  def _89?
    return $cache[self.sum_square_digits]
  end
end

puts (2...10000000).count(&:_89?)
