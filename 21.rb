def divisors(n)
  (2..Math.sqrt(n).floor).map { |d| [d, n/d] if n % d == 0 }.compact.flatten.uniq.push(1)
end

def sum_divisors(n)
  divisors(n).inject(:+)
end

puts (3..9999).map { |n|
  sum = sum_divisors(n)
  n if sum != 1 && sum != n && n == sum_divisors(sum)
}.compact.inject(:+)
