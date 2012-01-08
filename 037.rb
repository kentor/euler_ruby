class String
  def include_0468?
    include?('0') || include?('4') || include?('6') || include?('8')
  end

  def include_25?
    include?('2') || include?('5')
  end
end

class Integer
  def prime?
    return true  if self == 2 || self == 3
    return false if self == 1
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    (3..Math.sqrt(self).floor).step(2).each do |div|
      return false if self % div == 0
    end

    return true
  end

  def truncatable_prime?
    string = self.to_s

    return false if string.include_0468?
    return false if string[1...string.size].include_25?
    return false if string[-1] == "1" || string[0] == "1"
    return false if string[-1] == "9" || string[0] == "9"
    return false if !self.prime?

    (1...string.size).each do |n|
      return false if !(self/(10**n)).prime?
      return false if !string[n...string.size].to_i.prime?
    end

    return true
  end
end

n, t_primes = 21, []
until t_primes.size == 11
  t_primes << n if (n += 2).truncatable_prime?
end

puts t_primes.inject(:+)
