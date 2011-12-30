class Integer
  def palindromic?
    self == self.to_s.reverse.to_i && self == self.to_s(2).reverse.to_i(2)
  end
end

puts (1...1000000).select(&:palindromic?).inject(:+)
