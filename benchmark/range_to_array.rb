require 'benchmark'

n = 1_000_000

Benchmark.bmbm(30) do |x|
  x.report("to_a") { (1..n).to_a }
  x.report("explode") { [*1..n] }
end

# they are about the same
#                                      user     system      total        real
# to_a                             0.050000   0.010000   0.060000 (  0.061691)
# explode                          0.050000   0.010000   0.060000 (  0.065453)
