class Integer
  def factorial
    return 1 if self < 2
    (1..self).inject(:*)
  end

  def curious?
    self == self.to_s.chars.map { |n| n.to_i.factorial }.inject(:+)
  end
end

puts (10..99999).select(&:curious?).inject(:+)
