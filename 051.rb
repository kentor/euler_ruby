require 'set'
require 'sieve'

class Integer
  def include_3?
    ary = self.to_s.split('')
    if (ary.count(d = "0") == 3 || ary.count(d = "1") == 3 || ary.count(d = "2") == 3)
      return self.to_s.tr!(d, ".")
    end
  end
end

primes = 1_000_000.sieve.select { |p| p > 99999 }.to_set

primes.each do |p|
  next unless (raw = p.include_3?)
  count = (0..9).count do |d|
    n = raw.tr(".", d.to_s).to_i
    primes.include?(n)
  end
  if count == 8; puts p; break; end
end
