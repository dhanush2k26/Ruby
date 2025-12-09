require 'colorize'
print "Enter Array of element space Separated:"
n=gets.chomp.split.map(&:to_i)
sorted_arr=n.sort.uniq
print "#{n}\n"
puts "The Smallest value in array is #{sorted_arr[0]}"
puts "The Second Smallest value in array is #{sorted_arr[1]}"
