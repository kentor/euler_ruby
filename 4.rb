max = 0

901.upto(999) do |x|
  x.upto(999) do |y|
    prod = x*y
    max = prod if prod == prod.to_s.reverse.to_i && prod > max
  end
end

puts max
