=begin
3.	Write a Ruby program to convert minutes into a number of years and days.
=end
puts "Conversion of Minutes to Years and Days"
puts "......"
print "Enter The Minutes: "
minutes = gets.chomp.to_i
years = minutes / 525600
remaining_minutes = minutes % 525600
days = remaining_minutes / 1440
puts "The given Minutes #{minutes} is equivalent to #{years} years and #{days} days"