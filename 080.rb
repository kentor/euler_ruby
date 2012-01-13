require 'bigdecimal'

puts (2..99).map { |n|
  (n**0.5) % 1 == 0 ? 0 : BigDecimal.new(n).sqrt(100).to_s[2,100].chars.map(&:to_i).inject(:+)
}.inject(:+)
