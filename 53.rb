class Integer
  def !
    return 1 if self < 2
    (1..self).inject(:*)
  end

  def choose(r)
    self.! / (r.! * (self-r).!)
  end
end

puts (23..100).map { |n| (2..n-2).select { |r| n.choose(r) > 1000000 }.size }.inject(:+)

# count = 0
# 23.upto(100) do |n|
#   n_count = 0
#   2.upto(n/2) do |r|
#     n_count += 1 if n.choose(r) > 1000000
#   end
#   n_count *= 2
#   n_count -= 1 if n.even?
#   count += n_count
# end

# puts count
