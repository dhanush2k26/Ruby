=begin
8.	Write a program in Ruby to display the multiplication table of a given integer.
=end
print "Enter the integer for multiply table:"
n=gets.chomp.to_i
for i in 1..10 do
    puts "#{i} * #{n}=#{i*n}"
end