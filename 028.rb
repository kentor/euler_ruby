puts 3.step(1001, 2).inject(1) { |memo,n|
  sq, d = n*n, n-1
  memo + (sq - 3*d).step(sq, d).inject(:+)
}
