expansion = [1 + Rational(1, 2)]
expansion << 1 + Rational(1, 1 + expansion[-1]) until expansion.size == 1000
puts expansion.count { |r| r.numerator.to_s.size > r.denominator.to_s.size }
