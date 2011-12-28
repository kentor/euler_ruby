index, triangle = 0, 0
loop do
  triangle += (index += 1)
  count = 0
  1.upto(Math.sqrt(triangle).floor) do |fact|
    count += 1 if triangle % fact == 0
  end
  break if count > 251
end

puts triangle
