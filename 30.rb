puts (2..6*9**5).select { |n| n == n.to_s.split('').map { |d| d.to_i ** 5 }.inject(:+) }.inject(:+)
