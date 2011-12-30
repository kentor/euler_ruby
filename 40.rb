string, n = "", 0
string << (n += 1).to_s while string.size < 10**6
puts (0..6).map { |n| string[10**n-1].to_i }.inject(:*)
