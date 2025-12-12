require "colorize"

print "Enter the Array of value by space Separated:".blue
arr=gets.chomp.split.map(&:to_i)
print "#{arr}\n".green
print "Enter value insert first:".blue
n=gets.chomp.to_i
arr.unshift(n)
print "#{arr}\n".green
