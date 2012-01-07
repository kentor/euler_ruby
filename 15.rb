class Integer
  def !
    (1..self).inject(:*)
  end
end
# 40 choose 20
puts !40 / (!20 * !20)
