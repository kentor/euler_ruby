require 'benchmark'
require 'prime'

class Integer
  def my_prime?
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
  x.report("39916801.prime?") { 39916801.prime? }
  x.report("39916801.my_prime?") { 39916801.my_prime? }
  x.report("2971215073.prime?") { 2971215073.prime? }
  x.report("2971215073.my_prime? ") { 2971215073.my_prime? }
  x.report("68720001023.prime?") { 68720001023.prime? }
  x.report("68720001023.my_prime? ") { 68720001023.my_prime? }
end

# Custom prime? method is faster
#                                      user     system      total        real
# 39916801.prime?                  0.000000   0.000000   0.000000 (  0.003074)
# 39916801.my_prime?               0.000000   0.000000   0.000000 (  0.000607)
# 2971215073.prime?                0.040000   0.000000   0.040000 (  0.037939)
# 2971215073.my_prime?             0.020000   0.000000   0.020000 (  0.018962)
# 68720001023.prime?               0.130000   0.000000   0.130000 (  0.129095)
# 68720001023.my_prime?            0.050000   0.000000   0.050000 (  0.049974)