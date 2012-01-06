puts (901..999).to_a.combination(2).map { |x,y| x*y }.select { |n| n == n.to_s.reverse.to_i }.max
