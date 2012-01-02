class Array
  def asdf?
    return false if self[0] == 0
    return false if self[5] != 5
    return false if self[3] % 2 != 0
    return false if (100*self[7] + 10*self[8] + self[9]) % 17 != 0
    return false if (100*self[6] + 10*self[7] + self[8]) % 13 != 0
    return false if (100*self[5] + 10*self[6] + self[7]) % 11 != 0
    return false if (100*self[4] + 10*self[5] + self[6]) % 7 != 0
    return false if (self[2] + self[3] + self[4]) % 3 != 0
    return true
  end
end

puts (0..9).to_a.permutation.select(&:asdf?).map { |a| a.join.to_i }.inject(:+)
