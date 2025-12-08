=begin
7.	Write a Ruby program that takes a year from the user and prints whether that year is a leap year or not.
=end
print "Enter the year:"
year=gets.chomp.to_i
puts "The  #{year}  is a #{(year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) ? "leap year" : "common year")}"