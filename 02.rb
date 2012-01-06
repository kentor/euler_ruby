fib = [1, 2]
fib << @sum while (@sum = fib.last(2).inject(:+)) < 4000000
puts fib.select(&:even?).inject(:+)
