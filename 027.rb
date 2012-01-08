class Integer
  def prime?
    return false if self < 0
    return true  if self == 2 || self == 3
    return false if self == 1
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    (3..Math.sqrt(self).floor).step(2).each do |div|
      return false if self % div == 0
    end

    return true
  end
end

def quad(n, a, b)
  n*n + a*n + b
end

max, best_a, best_b = 0, 0, 0

(-999..999).step(2).to_a.permutation(2) do |a,b|
  consec, n = 0, -1
  consec += 1 while quad(n+=1, a, b).prime?
  max, best_a, best_b = consec, a, b if consec > max 
end

puts best_a * best_b
