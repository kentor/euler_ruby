class Integer
  def prime?
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    (3..Math.sqrt(self).floor).step(2).each do |div|
      return false if self % div == 0
    end

    return true
  end
end

puts (1..7).to_a.permutation.map { |a| a.join.to_i }.select(&:prime?).max
