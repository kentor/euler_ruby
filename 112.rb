class Integer
  def bouncy?(q = self, state = nil)
    return false if self < 101
    sorted = self.to_s.chars.sort.join
    self != sorted.to_i && self != sorted.reverse.to_i
  end
end

count, total = 0, 0
loop do
  if (total += 1).bouncy?
    count += 1
    break if count.to_f / total == 0.99
  end
end

puts total
