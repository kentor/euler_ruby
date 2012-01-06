puts (1..100).inject(:+)**2 - (1..100).map { |n| n*n }.inject(:+)
