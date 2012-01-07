puts (3..12000).map { |d|
  lower = d % 3 == 0 ? d/3 + 1 : (d/3.0).ceil
  upper = d % 2 == 0 ? d/2 - 1 : (d/2.0).floor
  (lower..upper).count { |n| n.gcd(d) == 1 }
}.inject(:+)
