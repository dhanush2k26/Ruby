=begin
6.	Write a Ruby program that reads a floating-point number and prints "zero" if the number is zero. 
Otherwise, print "positive" or "negative". 
Add "small" if the absolute value of the number is less than 1, or "large" if it exceeds 1,000,000.
=end
print "Enter the number:"
n = gets.chomp.to_f

if n == 0
  puts "zero"
elsif n > 0
  if n.abs < 1
    puts "positive small"
  elsif n > 1_000_000
    puts "positive large"
  else
    puts "positive"
  end

else
  if n.abs < 1
    puts "negative small"
  elsif n.abs > 1_000_000
    puts "negative large"
  else
    puts "negative"
  end
end