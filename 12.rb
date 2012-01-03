index, triangle = 0, 0
loop do
  triangle += (index += 1)
  count = 0
  1.upto(Math.sqrt(triangle).floor) { |div| count += 1 if triangle % div == 0 }
  break if count > 251
  # break if ((1..Math.sqrt(triangle).floor).count { |div| triangle % div == 0 }) > 251 SLOW!!!!!
end

puts triangle
