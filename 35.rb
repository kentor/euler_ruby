class String
  def rotate!
    return self if size == 1
    replace self[1...size] + self[0]
  end

  def include_024568?
    include?('0') || include?('2') || include?('4') ||
    include?('5') || include?('6') || include?('8')
  end
end

class Integer
  def prime?
    return true  if self == 2 || self == 3
    return false if self == 1
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.upto(Math.sqrt(self).floor) do |div|
      return false if self % div == 0
    end

    return true
  end

  def circular_prime?
    string = self.to_s

    return false if string.include_024568?
    return false if !self.prime?

    until string.rotate!.to_i == self
      return false if !string.to_i.prime?
    end

    return true
  end
end

puts (11...10**6).step(2).select(&:circular_prime?).size + 4
