=begin
9.	Write a program in Ruby to make such a pattern as a right-angle triangle with a number increased by 1.
 The pattern like :
1
2 3
4 5 6
7 8 9 10 

=end
print "Enter the Value:"
n=gets.chomp.to_i
temp=0
for i in 1..n do
     (1..i).each do
            temp+=1
            print "#{temp} "
    end
    puts
end