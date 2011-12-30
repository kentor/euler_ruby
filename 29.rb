keep = []

(2..100).each do |a|
  (2..100).each do |b| 
    keep << a**b
  end
end

puts keep.size
