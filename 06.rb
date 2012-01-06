puts (1..100).inject(:+)**2 - (1..100).inject { |s, n| s + n*n }
