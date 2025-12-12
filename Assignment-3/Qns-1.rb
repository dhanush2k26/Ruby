require 'colorize'
puts "Inches to Meter".yellow
print "Enter the inches value:"
n=gets.chomp.to_f
begin
   if n <=0
         raise 
   end
rescue 
  puts "Inserted Value is wrong".red
  print "Enter the inches value again:"
  n=gets.chomp.to_f
  retry
end
puts "The #{n} inches is #{n*0.0254.round(2)} meters".green

