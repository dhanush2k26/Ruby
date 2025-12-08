=begin
2.	Write a Ruby program that reads an integer between 0 and 1000 and adds all the digits in the integer
=end
temp=0
sum=0
print "Enter the Number betwen 1 to 1000:"
n=gets.chomp.to_i
if n>0 && n<1000
  temp=n
    while temp>0
           sum += temp % 10
           temp /= 10 
    end
end

puts "The sum of the digit  #{n} is #{sum}"