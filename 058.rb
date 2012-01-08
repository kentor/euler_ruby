class Integer
  def prime?
    return true  if self == 3
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    (3..Math.sqrt(self.to_f).floor).step(2).each do |div|
      return false if self % div == 0
    end

    return true
  end
end

count, total = 0, 1

(3..10**10).step(2).each do |length|
  upper, step = length * length, length - 1
  lower = upper - 3*step
  count += (lower..upper).step(step).count(&:prime?)
  next unless count.to_f / (total += 4) < 0.1
  puts length
  break
end
