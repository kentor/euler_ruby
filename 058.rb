class Integer
  def prime?
    return true  if self == 3
    return false if (self + 1) % 6 != 0 && (self - 1) % 6 != 0

    3.step(Math.sqrt(self.to_f).floor, 2) do |div|
      return false if self % div == 0
    end

    return true
  end
end

count, total = 0, 1

3.step(10000000000, 2) do |length|
  limit, step = length * length, length - 1
  count += (limit-3*step).step(limit, step).count(&:prime?)
  next unless count.to_f / (total += 4) < 0.1
  puts length
  break
end
