def factorial(n)
  acc = 1
  n.downto(1) { |i| acc *= i }
  acc
end
