require 'mathn'
sum, p = 0, Prime.new

while (a = p.next) < 2000000
  sum += a
end

puts sum
