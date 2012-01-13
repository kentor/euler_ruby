class Integer
  def rad_sieve
    sieve = [0] + [1]*self
    sieve.each_with_index do |rad,p|
      next if rad != 1 || p < 2
      p.step(self, p) { |n| sieve[n] *= p }
    end
    sieve
  end

  Rad = 100000.rad_sieve

  def rad
    Rad[self]
  end
end

puts (0..100000).to_a.sort_by!(&:rad)[10000]
