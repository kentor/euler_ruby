puts [*2..100].repeated_permutation(2).map { |a,b| a**b }.uniq!.size
