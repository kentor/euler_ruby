require 'benchmark'

class Integer
  def string_concat(other)
    "#{self}#{other}".to_i
  end

  def digit_concat(other)
    self * 10 ** (Math.log10(other).floor + 1) + other
  end
end

n = 1_000_000

Benchmark.bmbm(15) do |x|
  x.report 'string_concat' do
    n.times { 123.string_concat(123) }
  end

  x.report 'digit_concat' do
    n.times { 123.digit_concat(123) }
  end
end

#                       user     system      total        real
# string_concat     0.070000   0.000000   0.070000 (  0.076194)
# digit_concat      0.100000   0.000000   0.100000 (  0.095069)