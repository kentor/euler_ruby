# lookup = {"1" => 1, "2" => 2}
# longest_length, number = 0, 0

# 3.upto(999999) do |n|
#   next if n % 2 == 0
#   temp = n
#   current_length = 1
#   loop do
#     succ = n % 2 == 0 ? n = n/2 : n = 3*n + 1
#     if lookup.include?(succ.to_s)
#       current_length += lookup[succ.to_s]
#       break
#     end
#     n = succ
#     current_length += 1
#   end
#   lookup[temp.to_s] = current_length
#   if current_length > longest_length
#     longest_length = current_length
#     number = temp
#   end
# end

# puts number


def seq_length(n)
  length = 1
  while n != 1
    n = n % 2 == 0 ? n = n/2 : n = 3*n + 1
    length += 1
  end
  return length
end

max, num = 0, 0

500001.upto(999999) do |n|
  next if n % 2 == 0
  length = seq_length(n)
  if length > max
    max = length
    num = n
  end
end

puts num
