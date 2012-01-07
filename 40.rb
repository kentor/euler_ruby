string, n = "0", 0
string << (n += 1).to_s while string.size <= 1000000
puts (0..6).map { |n| string[10**n].to_i }.inject(:*)
