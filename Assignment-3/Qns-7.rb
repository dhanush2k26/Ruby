require 'colorize'
print "Enter the Array of value by space Separated:".blue
arr=gets.chomp.split.map(&:to_i)
print "#{arr}\n".green

print "Enter the index to find value:"
index=gets.chomp.to_i

puts "The Value is #{arr.at(index-1)}"