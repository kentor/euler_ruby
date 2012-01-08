puts (2...100).to_a.permutation(2).map { |a,b| (a**b).to_s.chars.map(&:to_i).inject(:+) }.max
