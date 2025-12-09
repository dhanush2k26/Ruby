require 'colorize'
print "Enter Array of element space Separated:"
n=gets.chomp.split.map(&:to_i)
odd=0
even=0

for i in 0...n.length
   if n[i].even?
         even += 1
   else
        odd += 1
   end

end
puts "The odd count is #{odd}".red
puts "The even count is #{even}".blue
