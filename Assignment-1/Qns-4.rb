=begin
4.	Write a Ruby program that accepts two integers from the user
 and then prints the sum, the difference, the product, the average, the distance (the difference between integers),
 the maximum (the larger of the two integers), and the minimum (the smaller of the two integers).
=end
print "Enter a Numerical value for 1st value: "
a=gets.chomp.to_i
print "\nEnter a Numerical value for 2nd value: "
b=gets.chomp.to_i
puts "The Sum of #{a} and #{b} is #{(a + b)}"
puts "The Difference of #{a} and #{b} is #{(a - b)}"
puts "The Product of #{a} and #{b} is #{(a * b)}"
puts "The Average of #{a} and #{b} is #{((a + b) / 2)}"
puts "The Distance of #{a} and #{b} is #{(a - b).abs}"
puts "The Maximum of #{a} and #{b} is #{[a, b].max}"
puts "The Minimum of #{a} and #{b} is #{[a, b].min}"

