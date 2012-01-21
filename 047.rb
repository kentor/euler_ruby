require 'prime'

class Integer
  def four_factors?
    self.prime_division.size == 4
  end
end

n = 646
while true
  unless (n+4).four_factors?; n += 4; next; end
  unless (n+3).four_factors?; n += 3; next; end
  unless (n+2).four_factors?; n += 2; next; end
  next unless (n+=1).four_factors?
  puts n
  break
end
