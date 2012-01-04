require 'set'
require 'prime'

primes = Prime.each(1000000).to_set
array = []

sum, num = 0, nil
primes.each do |p|
  sum += p
  break if sum > 1000000
  array.unshift(p)
end

array.size.downto(21) do |window|
  (array.size - window).times do |i|
    sum = array[i...window+i].inject(:+)
    if primes.include?(sum); num = sum; break; end
  end
  break if num
end

puts num
