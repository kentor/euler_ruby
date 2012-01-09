require 'benchmark'
require 'prime'
require 'set'

class Integer
  def prime?
    return true  if self == 2 || self == 3
    return false if self == 1
    return false if self % 2 == 0
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.step(Math.sqrt(self.to_f).floor, 2) do |div|
      return false if self % div == 0
    end

    return true
  end
end

Benchmark.bm(30) do |x|
  x.report("select 1e3:") { (1..1000).select(&:prime?).to_set }
  x.report("generate 1e3:") { Prime.each(1000).to_set }

  x.report("select 1e4:") { (1..10000).select(&:prime?).to_set }
  x.report("generate 1e4:") { Prime.each(10000).to_set }

  x.report("select 1e5:") { (1..100000).select(&:prime?).to_set }
  x.report("generate 1e5:") { Prime.each(100000).to_set }

  x.report("select 1e6:") { (1..1000000).select(&:prime?).to_set }
  x.report("generate 1e6:") { Prime.each(1000000).to_set }
end

# Prime generator is faster than select(&:prime?)
#                                      user     system      total        real
# select 1e3:                      0.000000   0.000000   0.000000 (  0.001344)
# generate 1e3:                    0.000000   0.000000   0.000000 (  0.001866)
# select 1e4:                      0.020000   0.000000   0.020000 (  0.022779)
# generate 1e4:                    0.020000   0.000000   0.020000 (  0.014972)
# select 1e5:                      0.290000   0.000000   0.290000 (  0.287634)
# generate 1e5:                    0.200000   0.000000   0.200000 (  0.203340)
# select 1e6:                      5.120000   0.010000   5.130000 (  5.123359)
# generate 1e6:                    4.160000   0.000000   4.160000 (  4.164597)