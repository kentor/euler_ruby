require 'set'

pentagonals = (1..2500).map { |n| n*(3*n-1)/2 }.to_set

min = pentagonals.to_a.combination(2).select do |a,b|
  pentagonals.include?(a+b) && pentagonals.include?((a-b).abs)
end.map { |a,b| (a-b).abs }.min

puts min
