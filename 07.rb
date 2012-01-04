require 'prime'
a, p = Prime.each, 0
10001.times { |n| puts p if (p = a.next) && n == 10000 }
