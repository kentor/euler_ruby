fractions = []

(10..98).each do |n|
  ((n+1)..99).each do |d|
    first_n, last_n = n.to_s.chars.map(&:to_i)
    first_d, last_d = d.to_s.chars.map(&:to_i)
    next if last_n != first_d
    fractions << [n, d] if n.to_f / d == first_n.to_f / last_d
  end
end

puts fractions.transpose.map { |n| n.inject(:*) }.to_s
