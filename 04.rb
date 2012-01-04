max = 0

(901..999).to_a.combination(2) do |x,y|
  prod = x*y
  max = prod if prod == prod.to_s.reverse.to_i && prod > max
end

puts max
