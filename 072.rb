require 'prime'

class Integer
  Primes = Prime.each(1000).to_a

  def prime_division(n = self, pf = [])
    Primes.each do |p|
      break if p*p > self
      count = 0
      count, n = count + 1, n / p while n % p == 0
      pf << [p, count] if count != 0
    end
    pf << [n, 1] if n > 1
    pf
  end

  def phi
    self.prime_division.map { |p,k| p**(k-1) * (p-1) }.inject(:*)
  end
end

puts (2..1000000).map(&:phi).inject(:+)
