max_p, max = 120, 3

122.step(998, 2) do |p|
  count = (2..p/3).count { |a| (p*(p-2*a)) % (2*(p-a)) == 0 }
  max_p, max = p, count if count > max
end

puts max_p
