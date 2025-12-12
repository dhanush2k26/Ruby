require "colorize"

print "Enter the decimial value:".blue
n=gets.chomp.to_i
begin
   if n <=0
         raise 
   end
rescue 
  puts "Inserted Value is wrong".red
  print "Enter the decimial value again:".blue
  n=gets.chomp.to_i
  retry
end
puts "The Binary of #{n} in decimal is #{n.to_s(2)}".green