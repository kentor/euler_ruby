# What is the smallest number divisible by each of the numbers 1 to 20?

n = (1..20).inject(:*)

20.downto(2) do |fact|
  n /= fact while n % fact == 0 && (2..20).map { |test| (n / fact) % test == 0 }.all?
end

puts n
