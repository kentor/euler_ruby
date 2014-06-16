require 'sieve'
require 'set'

Primes = 9_999.sieve.to_set

class Integer
  def prime?
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.step(Math.sqrt(self).floor, 2) do |div|
      return false if self % div == 0
    end
  end

  def concat(other)
    "#{self}#{other}".to_i
  end

  def concat(other)
    digits = Math.log10(other).floor + 1
    self * 10 ** digits + other
  end
end