class Integer
  def reverse
    self.to_s.reverse.to_i
  end

  def palindromic?
    self == self.reverse
  end
    
  def lychrel?(n = self)
    49.times { return false if (n += n.reverse).palindromic? }
  end
end

puts (1...10000).count(&:lychrel?)
