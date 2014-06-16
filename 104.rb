require 'matrix'

class Integer
  def super_pandigital?
      q, begin_set, end_set = self, [false] * 10, [false] * 10

          9.times do
                q, r = q / 10, q % 10
                      return false if r == 0 || end_set[r]
                            end_set[r] = true
                                end

                                    q = q / 10 ** (q.to_s.size - 9)
                                        9.times do
                                              q, r = q / 10, q % 10
                                                    return false if r == 0 || begin_set[r]
                                                          begin_set[r] = true
                                                              end

                                                                  return true
                                                                    end
                                                                end

seed = Matrix[[1,1],[1,0]] ** 2748
curr, prev, k = seed[0,0], seed[0,1], 2749
seed = nil

# string, pandigital = curr.to_s, ('1'..'9').to_a

# until string[0,9].chars.sort == pandigital && string[-9,9].chars.sort == pandigital
until curr.super_pandigital?
  curr, prev, k = curr + prev, curr, k + 1
  puts curr
  puts prev
  sleep(1)
#  string = curr.to_s
end

puts k

