ways = [0]*201
ways[0] = 1
[1,2,5,10,20,50,100,200].each do |x|
  (x..200).each do |i|
    ways[i] += ways[i-x]
  end
end

puts ways.last
