def one_over(num)
  remainder = 1
  r = []
  while remainder != 0
    quotient, remainder = (remainder * 10).divmod(num)
    match_pos = r.index(remainder)
    return r.size - match_pos if match_pos
    r << remainder
  end

  return 0
end

d, longest = 0, 0

2.upto(1000) do |num|
  next if num.even?
  size = one_over(num)
  d, longest = num, size if size > longest
end

puts d
