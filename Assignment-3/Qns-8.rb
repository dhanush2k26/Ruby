require 'colorize'
print "Enter the Array of value by space Separated:".blue
arr=gets.chomp.split.map(&:to_i)
print "#{arr}\n".green

print "Enter the index to update value:"
index=gets.chomp.to_i
print "Enter the value to update:"
ele=gets.chomp.to_i
arr[index-1]=ele
print "#{arr}\n".green
