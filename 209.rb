n, skip = 138902663, 4
n -= (skip = skip == 4 ? 6 : 4) until (n*n).to_s =~ /^1.2.3.4.5.6.7.8.9$/
puts n*10
