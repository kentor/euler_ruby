Squares = (1..7071).map { |n| n*n }
palindromes = []

Squares.each_with_index do |n,i|
  sum = n
  Squares[(i+1)...Squares.size].each do |s|
    sum += s
    break if sum > 100_000_000
    palindromes << sum if sum == sum.to_s.reverse.to_i
  end
end

puts palindromes.uniq!.inject(:+)
