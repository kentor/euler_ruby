require 'set'

class Integer
  def include_even?(s = self.to_s)
    s.include?('0') || s.include?('2') || s.include?('4') ||
    s.include?('6') || s.include?('8')
  end
end

set = Set.new
count = 0

11.upto(100_000_000) do |n|
  next if set.include?(n)
  next if n % 10 == 0
  reverse = n.to_s.reverse.to_i
  next if (n + reverse).include_even?
  set.add(reverse)
  count += 2
end

puts count
