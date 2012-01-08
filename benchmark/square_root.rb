require 'benchmark'

array = (1..1000000).map { rand*100000 }

Benchmark.bm(30) do |x|
  x.report("Math.sqrt(n)") { array.each { |n| Math.sqrt(n) } }
  x.report("n ** 0.5") { array.each { |n| n ** 0.5 } }
  
  x.report("Math.sqrt(123948293.0)") { 1000000.times { Math.sqrt(123948293.0) } }
  x.report("Math.sqrt(123948293)") { 1000000.times { Math.sqrt(123948293) } }
  x.report("123948293 ** 0.5") { 1000000.times { 123948293 ** 0.5 } }

  x.report("Math.sqrt(1234123451295127.0)") { 1000000.times { Math.sqrt(1234123451295127.0) } }
  x.report("Math.sqrt(1234123451295127)") { 1000000.times { Math.sqrt(1234123451295127) } }
  x.report("1234123451295127 ** 0.5") { 1000000.times { 1234123451295127 ** 0.5 } }
end

# Math.sqrt(n) is faster than n ** 0.5 as long as n is converted into a float.
