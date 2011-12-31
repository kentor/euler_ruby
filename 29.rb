keep = []
2.upto(100) do |a|
  2.upto(100) do |b| 
    keep << a**b
  end
end

puts keep.uniq.size
