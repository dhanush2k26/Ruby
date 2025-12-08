=begin
1.	Write a Ruby program to convert temperature from Fahrenheit to Celsius degree
=end

print "Enter the Fahrenheit:"
Fahrenheit=gets.chomp.to_f
Celsius=(Fahrenheit-32)*5/9

puts "The fahernheit is #{Fahrenheit} F and its equivalent Celsius is #{Celsius.round(2)} C"

