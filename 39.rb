max_p, max = 120, 3

(122..998).step(2).each do |p|
  count = (2..p/3).select { |a| (p*(p-2*a)) % (2*(p-a)) == 0 }.size
  max_p, max = p, count if count > max
end

puts max_p
