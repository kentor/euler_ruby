class Integer
  def seq_length(n = self, length = 1)
    until n == 1
      n = n.even? ? n = n/2 : n = 3*n + 1
      length += 1
    end
    length
  end
end

max, num, length = 0, 0, 0

(500001..999999).step(2).each do |n|
  max, num = length, n if (length = n.seq_length) > max
end

puts num
