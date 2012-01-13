require 'benchmark'

Benchmark.bm(30) do |x|
  x.report("Range#===") { 100_000.times { (1..100_000_000) === 50_000_000 } }
  x.report("Range#cover?") { 100_000.times { (1..100_000_000).cover?(50_000_000) } }
  x.report("Range#include?") { 100_000.times { (1..100_000_000).include?(50_000_000) } }

  x.report("Range#===") { 10_000.times { ("AAA".."ZZZ") === "AMZ" } }
  x.report("Range#cover?") { 10_000.times { ("AAA".."ZZZ").cover?("AMZ") } }
  x.report("Range#include?") { 10_000.times { ("AAA".."ZZZ").include?("AMZ") } }
end

# Range#=== and Range#include? is O(n) while Range#cover? is O(1) when testing non-integer values
#                                      user     system      total        real
# Range#===                        0.040000   0.000000   0.040000 (  0.036937)
# Range#cover?                     0.030000   0.000000   0.030000 (  0.026796)
# Range#include?                   0.030000   0.000000   0.030000 (  0.029670)
# Range#===                        1.830000   0.000000   1.830000 (  1.833286)
# Range#cover?                     0.010000   0.000000   0.010000 (  0.009905)
# Range#include?                   1.780000   0.000000   1.780000 (  1.780727)
