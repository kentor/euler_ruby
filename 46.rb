require 'set'
require 'prime'

primes = Prime.each(10000).to_set
squares = Set.new (1..1000) { |n| n*n }

(35...10000).step(2).each do |n|
  next if primes.include?(n)

  flag = true

  primes.each do |p|
    break if p > n
    if squares.include?((n - p)/2)
      flag = false
      break
    end
  end

  if flag; puts n; break; end
end

