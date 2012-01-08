require 'set'
require 'prime'

primes = Prime.each(10000).to_set
test_set = primes.select do |p|
  (1000...3000) === p && !p.to_s.include?('0') && p != 1487
end

test_set.each do |p|
  permutations = p.to_s.split('').permutation.map { |n| n.join.to_i }.
    select { |n| primes.include?(n) }
  diff = permutations.map { |n| n - p }.reject { |n| n == 0 }
  next unless d = (diff & diff.map { |n| n/2 }).first
  puts p.to_s + (p + d).to_s + (p + 2*d).to_s
  break
end
