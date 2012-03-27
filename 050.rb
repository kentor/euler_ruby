require 'prime'

class Integer
  def prime?
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.step(Math.sqrt(self), 2) do |div|
      return false if self % div == 0
    end

    return true
  end
end

prime_gen = Prime.each
array = []

sum, num = 0, nil
while true
  sum += (p = prime_gen.next)
  break if sum > 1_000_000
  array.unshift(p)
end

array.size.downto(21) do |window|
  array.each_cons(window).each do |a|
    sum = a.inject(:+)
    if sum.prime?; num = sum; break; end
  end
  break if num
end

puts num
