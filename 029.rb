puts (2..100).to_a.repeated_permutation(2).map { |a,b| a**b }.uniq.size
