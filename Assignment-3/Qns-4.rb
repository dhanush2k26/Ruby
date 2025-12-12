require "colorize"

print "Enter the binary value:".blue
n = gets.chomp
begin
  if n.empty?
    raise
  end
rescue
  puts "Inserted Value is wrong".red
  print "Enter the binary value again:".blue
  n = gets.chomp
  retry
end

decimal_value = n.to_i(2)

puts "The decimal of  #{n} in binary is #{decimal_value}".green