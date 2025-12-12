module Sorter
  def self.sorting a
    a.sort()
  end
end

print "Enter the Array of value with space separated:"
n=gets.chomp.split
puts "The Sorted Array is #{Sorter.sorting(n)}"
