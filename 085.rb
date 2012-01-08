puts (1..100).to_a.repeated_combination(2).min_by { |n,m| (n*(n+1)*m*(m+1)/4 - 2000000).abs }.inject(:*)
