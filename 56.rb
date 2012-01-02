max = 0
(2...100).each do |a|
  (2...100).each do |b|
    max = [max, (a**b).to_s.chars.map(&:to_i).inject(:+)].max
  end
end

puts max
