def num
  0.upto(1000) do |a|
    a.downto(0) do |b|
      c = 1000 - a - b
      a2, b2, c2 = a*a, b*b, c*c
      next if c2 > a2 + b2
      return a*b*c if a2 + b2 == c2
    end
  end
end

puts num
