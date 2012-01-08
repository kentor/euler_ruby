fib = [1, 2]
fib << @sum while (@sum = fib[-1] + fib[-2]) < 4000000
puts fib.select(&:even?).inject(:+)
