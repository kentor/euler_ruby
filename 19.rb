class Fixnum
  def leap_year?
    (self % 4 == 0 && self % 100 != 0) || self % 400 == 0
  end
end

years = (1900..2000)
months = (1..12)
count, day = 0, 1

days = {}
years.each do |year|
  days[year] = {}
  months.each do |month|
    days[year][month] = case month.to_s
    when /^4|6|9|11$/ then 30
    when /^2$/ then year.leap_year? ? 29 : 28
    else 31
    end
  end
end

years.each do |year|
  months.each do |month|
    day = (day + (days[year][month] - days[year][month]/7*7)) % 7
    count += 1 if day == 0 && year != 1900
  end
end

puts count
