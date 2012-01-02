ways = [0]*26
ways[0] = 1
[1,5,10,25].each do |x|
  (x..25).each do |i|
    ways[i] += ways[i-x]
  end
  puts ways.to_s
end

puts ways.to_s
