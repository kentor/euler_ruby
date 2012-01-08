class Integer
  def !
    return 1 if self < 2
    (1..self).inject(:*)
  end

  def choose(r)
    !self / (!r * !(self-r))
  end
end

puts (23..100).map { |n| (2..n-2).count { |r| n.choose(r) > 1000000 } }.inject(:+)
