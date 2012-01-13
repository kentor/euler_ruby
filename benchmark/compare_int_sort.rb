require 'benchmark'

Benchmark.bm(30) do |x|
  x.report("array compare") { 100000.times { 9515677345.to_s.chars.sort == 5437671559.to_s.chars.sort } }
  x.report("string compare") { 100000.times { 9515677345.to_s.chars.sort.join == 5437671559.to_s.chars.sort.join } }
  x.report("int compare") { 100000.times { 9515677345.to_s.chars.sort.join.to_i == 5437671559.to_s.chars.sort.join.to_i } }
end

# Array compare for sorted int is fastest
#                                      user     system      total        real
# array compare                    1.280000   0.000000   1.280000 (  1.284846)
# string compare                   1.390000   0.000000   1.390000 (  1.384216)
# int compare                      1.510000   0.000000   1.510000 (  1.511810)
