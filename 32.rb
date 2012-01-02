class Array
  def crazy?
    a = self

    multiplier = 100*a[2] + 10*a[3] + a[4]
    product = 1000*a[5] + 100*a[6] + 10*a[7] + a[8]
    
    multiplicand = 10*a[0] + a[1]
    return true if multiplicand * multiplier == product

    multiplicand, multiplier = a[0], 1000*a[1] + multiplier
    multiplicand * multiplier == product
  end
end

puts (1..9).to_a.permutation.select(&:crazy?).map { |a| a.pop(4).join.to_i }.uniq.inject(:+)
