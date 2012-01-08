cubes = (345..10000).map { |n| n**3 }
sorted_cubes = cubes.map { |n| n.to_s.chars.sort.join }

sorted_cubes.each_with_index do |n,i|
  next unless sorted_cubes.count(n) == 5
  puts cubes[i]
  break
end
