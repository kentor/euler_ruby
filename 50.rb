# class Integer
#   def prime?
#     return true  if self == 2 || self == 3
#     return false if self == 1
#     return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

#     3.upto(Math.sqrt(self).floor) do |div|
#       return false if self % div == 0
#     end
#   end
# end

# puts (1...1000000).step(2).select(&:prime?).size

require 'mathn'
puts Prime.each(10**6).count
