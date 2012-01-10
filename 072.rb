class PhiSieve
  def self.generate(limit)
    sieve = (0..limit).to_a
    sieve[0] = sieve[1] = 0
    sieve.each_with_index do |p,i|
      next if p != i || i < 2
      break if 2*p > limit
      p.step(limit, p) { |n| sieve[n] = sieve[n] / p * (p-1) }
    end
    sieve
  end
end

puts PhiSieve.generate(10**6).inject(:+)
