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
#                                      user     system      total        real
# Math.sqrt(n)                     0.240000   0.020000   0.260000 (  0.255435)
# n ** 0.5                         0.350000   0.000000   0.350000 (  0.358603)
# Math.sqrt(123948293.0)           0.200000   0.000000   0.200000 (  0.193684)
# Math.sqrt(123948293)             0.750000   0.000000   0.750000 (  0.751415)
# 123948293 ** 0.5                 0.330000   0.000000   0.330000 (  0.334984)
# Math.sqrt(1234123451295127.0)    0.200000   0.000000   0.200000 (  0.198684)
# Math.sqrt(1234123451295127)      0.800000   0.000000   0.800000 (  0.794392)
# 1234123451295127 ** 0.5          0.390000   0.000000   0.390000 (  0.388928)