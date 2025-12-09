#  Write a Ruby program to add two matrices of the same size. 
require 'colorize'
print "Enter the Array size:".yellow
n=gets.chomp.to_i
a=Array.new(n) { Array.new(n, 0) }
b=Array.new(n) { Array.new(n, 0) }
c=Array.new(n) { Array.new(n, 0) }


puts "Enter Value For First Matrix ".blue
for i in 1..n do
    for j in 1..n do
            print "Enter Value for [#{i}] [#{j}]:".green
            a[i-1][j-1]=gets.chomp.to_i;
    end
end
a.each { |row| p row }
puts "Enter Value For Second Matrix "
for i in 1..n do
    for j in 1..n do
            print "Enter Value for [#{i}] [#{j}]:"
            b[i-1][j-1]=gets.chomp.to_i;
    end
end

b.each { |row| p row }

for i in 1..n do
    for j in 1..n do
            c[i-1][j-1] = a[i-1][j-1] + b[i-1][j-1]
    end
end

puts "Sum of the Two Array:"
c.each { |row| p row }