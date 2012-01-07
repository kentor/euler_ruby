count = 0
(1..21).each do |p|
  (1..9).each do |d|
    count += 1 if (d ** p).to_s.size == p
  end
end
puts count
