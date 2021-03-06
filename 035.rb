class String
  def rotate!
    replace "#{self[1...size]}#{self[0]}"
  end

  def include_024568?
    include?('0') || include?('2') || include?('4') ||
    include?('5') || include?('6') || include?('8')
  end
end

class Integer
  def prime?
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.step(Math.sqrt(self).floor, 2) do |div|
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

    true
  end
end

puts (11...1_000_000).step(2).count(&:circular_prime?) + 4
