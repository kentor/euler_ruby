sum_square = square_sum = 0

1.upto(100) do |x|
  sum_square += x*x
  square_sum += x
end

puts square_sum * square_sum - sum_square