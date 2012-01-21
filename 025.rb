def first_fib_term(digits)
  succ, curr, term = 1, 0, 1
  while true
    succ, curr, term = succ + curr, succ, term + 1
    return term if succ.to_s.size == digits
  end
end

puts first_fib_term(1000)
