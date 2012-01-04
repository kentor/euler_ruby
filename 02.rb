succ, curr, sum = 1, 0, 0

while succ < 4000000
  succ, curr = succ + curr, succ
  sum += succ if succ.even?
end

puts sum
