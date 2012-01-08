require 'prime'

class Integer
  def divisors_count
    return 1 if self == 1
    self.prime_division.map { |a| a.last + 1 }.inject(:*)
  end
end

(1..10**10).inject do |triangle, n|
  if triangle.divisors_count > 500
    puts triangle
    break
  end
  triangle + n
end
