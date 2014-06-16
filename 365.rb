require 'sieve'
primes = 5000.sieve.select { |p| p > 1000 }
sum = 0
primes.each_with_index do |p,i|
  primes[(i+1)...primes.size].each_with_index do |q,j|
    primes[(j+1)...primes.size].each do |r|
      sum += p*q*r
    end
  end
end

puts sum
