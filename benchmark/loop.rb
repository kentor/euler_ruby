require 'benchmark'

max = 10_000_000

Benchmark.bm(30) do |x|
   x.report("each") do
     (0..max).each do
     end
   end

   x.report("for") do
     for i in 0..max
     end
   end

   x.report("each-var") do
     (0..max).each do |i|
     end
   end

   x.report("while") do
     n = 0
     while true
       break if n >= max
       n += 1
     end
   end

   x.report("loop") do
     n = 0
     loop do
       break if n >= max
       n += 1
     end
   end
end

# while loop is faster than loop do
#                                      user     system      total        real
# each                             0.810000   0.000000   0.810000 (  0.810836)
# for                              0.930000   0.000000   0.930000 (  0.928763)
# each-var                         0.850000   0.000000   0.850000 (  0.853102)
# while                            0.490000   0.000000   0.490000 (  0.492666)
# loop                             1.150000   0.000000   1.150000 (  1.151141)
