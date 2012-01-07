class Integer
  def !
    (1..self).inject(:*)
  end
end

puts !40 / (!20 * !20)
