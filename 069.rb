require 'prime'

class Integer
  def phi
    self * self.prime_division.map(&:first).inject(1) { |prod, p| prod * (1 - 1.0/p) }
  end
end

puts (2..1000000).step(2).map { |n| [n/n.phi, n] }.max[1]
