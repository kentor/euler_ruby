puts (2..10**6).map { |d| Rational((3.0/7.0 * d).floor, d) }.uniq!.reject! { |r| r.denominator == 7 }.max.numerator
