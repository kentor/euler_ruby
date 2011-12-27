sum = 0
a = b = 1
c = a + b

while c < 4000000
  sum += c if c % 2 == 0

  a = c
  c += b
  b = a
end

puts sum