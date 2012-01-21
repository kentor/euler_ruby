require 'benchmark'

ASCII = ".123456789"
BIN = "\000\001\002\003\004\005\006\007\010\011"

ss = "942"
s = "45642344757213"

Benchmark.bm(30) do |x|
  x.report("tr.unpack short") { 1000000.times { ss.tr(ASCII, BIN).unpack('c*') } }
  x.report("chars.map short") { 1000000.times { ss.chars.map(&:to_i) } }
  x.report("tr.unpack long") { 1000000.times { s.tr(ASCII, BIN).unpack('c*') } }
  x.report("chars.map long") { 1000000.times { s.chars.map(&:to_i) } }
end

# tr.unpack faster thatn chars.map but requires constants
#                                      user     system      total        real
# tr.unpack short                  1.470000   0.000000   1.470000 (  1.472524)
# chars.map short                  2.340000   0.000000   2.340000 (  2.340720)
# tr.unpack long                   1.860000   0.000000   1.860000 (  1.854883)
# chars.map long                   6.300000   0.000000   6.300000 (  6.307473)
