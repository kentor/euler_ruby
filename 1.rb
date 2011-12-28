sum = 0
1000.times { |n| sum += n if n % 3 == 0 || n % 5 == 0 }
puts sum
