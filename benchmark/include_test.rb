require 'benchmark'
require 'set'

array = (1..1000000).to_a
set = array.to_set

Benchmark.bm(30) do |x|
  x.report("Array#include?") { array.include?(1) }
  x.report("Set#include?") { set.include?(1) }
  x.report("Array#include?") { array.include?(500000) }
  x.report("Set#include?") { set.include?(500000) }
  x.report("Array#include?") { array.include?(1000000) }
  x.report("Set#include?") { set.include?(1000000) }
  x.report("Array#include?") { array.include?("dog") }
  x.report("Set#include?") { set.include?("dog") }
end

# Obviously use a set if you are using #include?
#                                      user     system      total        real
# Array#include?                   0.000000   0.000000   0.000000 (  0.000015)
# Set#include?                     0.000000   0.000000   0.000000 (  0.000012)
# Array#include?                   0.030000   0.000000   0.030000 (  0.031775)
# Set#include?                     0.000000   0.000000   0.000000 (  0.000007)
# Array#include?                   0.070000   0.000000   0.070000 (  0.080246)
# Set#include?                     0.000000   0.000000   0.000000 (  0.000005)
# Array#include?                   0.290000   0.000000   0.290000 (  0.288144)
# Set#include?                     0.000000   0.000000   0.000000 (  0.000013)
