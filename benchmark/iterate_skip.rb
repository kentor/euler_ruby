require 'benchmark'

Benchmark.bm(30) do |x|
  x.report("Range") { (1...10000000).step(2) { |n| n*n } }
  x.report("Step") { 1.step(10000000, 2) { |n| n*n } }
end

# No difference
