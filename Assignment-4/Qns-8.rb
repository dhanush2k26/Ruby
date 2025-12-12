def findout(n1, n2)
  if n1 == n2
    0
  elsif n1 % 5 == n2 % 5
    [n1, n2].min
  else
    [n1, n2].max
  end
end

print "Enter the First Value:"
n1 = gets.chomp.to_i
print "Enter the Second Value:"
n2 = gets.chomp.to_i
puts findout(n1, n2)