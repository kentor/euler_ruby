num = nil

(9..10**10).each do |n|
  next if n % 9 != 0 || (6*n).to_s.length != n.to_s.length

  sorted = n.to_s.chars.sort 
  6.downto(1) do |fact|
    break if (fact*n).to_s.chars.sort != sorted
    num = n if fact == 1
  end

  break if num
end

puts num
