class Integer
  def prime?
    return true  if self == 2 || self == 3
    return false if self == 1
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.step(Math.sqrt(self.to_f).floor, 2) do |div|
      return false if self % div == 0
    end
  end
end

puts (2000..4000).select(&:prime?).combination(2).select { |p,q|
  p*q < 10000000 && ((p-1)*(q-1)).to_s.chars.sort == (p*q).to_s.chars.sort
}.map { |p,q| [(1 - 1.0/p) * (1 - 1.0/q), p*q] }.max[1]
