ways = [0]*100
ways.unshift(1)
(1..100).each do |x|
  (x..100).each { |i| ways[i] += ways[i-x] }
end

puts ways.last-1
