# What is the largest prime factor of the number 600851475143?

def largest_prime(n)
  2.upto(Math.sqrt(n).floor) { |i| return largest_prime(n/i) if n % i == 0 }
  return n
end

puts largest_prime(600851475143)
