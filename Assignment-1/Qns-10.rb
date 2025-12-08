=begin
10.	Write a program in Ruby to make a pattern like a right-angle triangle
 with a number that will repeat a number in a row. The pattern is as follows:
1
22
333
4444 

=end
print "Enter the Value:"
n=gets.chomp.to_i
for i in 1..n do
     (1..i).each do
            print i
    end
    puts
end