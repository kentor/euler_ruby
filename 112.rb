class Integer
  def bouncy?
    sorted = self.to_s.chars.sort.join
    self != sorted.to_i && self != sorted.reverse.to_i
  end
end

count, total = 0, 100

until count.to_f / total == 0.99
  count += 1 if (total += 1).bouncy?
end

puts total
