class Integer
  def pentagonal?
    (Math.sqrt(24*self + 1) + 1) % 6 == 0
  end
end

num, n = 40756, 144
num, n = n*(2*n-1), n+1 until num.pentagonal?

puts num
