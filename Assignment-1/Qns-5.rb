=begin
5.	Write a Ruby program that takes three numbers from the user and prints the greatest number.
=end
print "Enter three different values (with single space):"
n = gets.chomp
v = n.split.map(&:to_i)
a=v[0]
b=v[1]
c=v[2]
puts "The gratest of the three number is #{(a > b) ? (a > c ? a : c) : (b > c ? b : c)}"
