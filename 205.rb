class Integer
  def !
    return 1 if self < 2
    (2..self).inject(:*)
  end

  def choose(r)
    !self / (!r * !(self - r))
  end
end

def prob(p, n, s)
  return 0 if p < n
  sum = (0..(p-n)/s).inject(0) do |memo,k|
    memo + (-1)**k * n.choose(k) * (p-s*k-1).choose(n-1)
  end
  Rational(sum, s**n)
end

peter = (0..36).map { |p| prob(p, 9, 4) }
colin = (0..36).map { |p| prob(p, 6, 6) }

puts 36.step(1, -1).to_a.combination(2).map { |p,c| peter[p]*colin[c] }.inject(:+).to_f
