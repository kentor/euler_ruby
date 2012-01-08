max = ""

def pandigital(n)
  pandigital, factor = "", 0
  pandigital << (n * (factor += 1)).to_s while pandigital.size < 9
  pandigital
end

(1..10000).each do |n|
  pandigital = pandigital(n)
  next if pandigital.size != 9 || pandigital.include?("0") || pandigital.split('').uniq!
  max = pandigital if pandigital > max
end

puts max
