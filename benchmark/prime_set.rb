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

class PrimeSieve
  def self.generate(limit)
    sieve = (0..limit).to_a
    sieve[0] = sieve[1] = nil
    sieve.each do |n|
      next unless n
      break if n*n > limit
      (n*n).step(limit, n) { |c| sieve[c] = nil }
    end
    sieve.compact
  end
end

Benchmark.bm(30) do |x|
  x.report("select 1e3:") { (1..1000).select(&:prime?).to_set }
  x.report("generate 1e3:") { Prime.each(1000).to_set }
  x.report("sieve 1e3:") { PrimeSieve.generate(1000).to_set }

  x.report("select 1e4:") { (1..10000).select(&:prime?).to_set }
  x.report("generate 1e4:") { Prime.each(10000).to_set }
  x.report("sieve 1e4:") { PrimeSieve.generate(10000).to_set }

  x.report("select 1e5:") { (1..100000).select(&:prime?).to_set }
  x.report("generate 1e5:") { Prime.each(100000).to_set }
  x.report("sieve 1e5:") { PrimeSieve.generate(100000).to_set }

  x.report("select 1e6:") { (1..1000000).select(&:prime?).to_set }
  x.report("generate 1e6:") { Prime.each(1000000).to_set }
  x.report("sieve 1e6:") { PrimeSieve.generate(1000000).to_set }

  x.report("select 1e7:") { (1..10000000).select(&:prime?).to_set }
  x.report("generate 1e7:") { Prime.each(10000000).to_set }
  x.report("sieve 1e7:") { PrimeSieve.generate(10000000).to_set }
end

# Ruby Prime library really sucks. Make your own sieve.
#                                      user     system      total        real
# select 1e3:                      0.000000   0.000000   0.000000 (  0.001336)
# generate 1e3:                    0.000000   0.000000   0.000000 (  0.002177)
# sieve 1e3:                       0.000000   0.000000   0.000000 (  0.000659)
# select 1e4:                      0.010000   0.000000   0.010000 (  0.018573)
# generate 1e4:                    0.030000   0.000000   0.030000 (  0.021531)
# sieve 1e4:                       0.000000   0.000000   0.000000 (  0.006370)
# select 1e5:                      0.230000   0.000000   0.230000 (  0.226737)
# generate 1e5:                    0.240000   0.000000   0.240000 (  0.240239)
# sieve 1e5:                       0.040000   0.000000   0.040000 (  0.043263)
# select 1e6:                      4.590000   0.010000   4.600000 (  4.599763)
# generate 1e6:                    4.330000   0.020000   4.350000 (  4.354300)
# sieve 1e6:                       0.540000   0.010000   0.550000 (  0.548924)
# select 1e7:                    111.690000   0.040000 111.730000 (111.754195)
# generate 1e7:                   87.220000   0.080000  87.300000 ( 87.609435)
# sieve 1e7:                       6.350000   0.150000   6.500000 (  6.830833)
