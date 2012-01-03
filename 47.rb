require 'prime'

class Integer
  def four_factors?
    self.prime_division.size == 4
  end
end

(647..10**10).each do |n|
  next unless (n+3).four_factors?
  next unless (n+2).four_factors?
  next unless (n+1).four_factors?
  next unless n.four_factors?
  puts n
  break
end
