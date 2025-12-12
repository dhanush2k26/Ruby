require 'colorize'
def input(src)
    print  "#{src}:".blue
n=gets.chomp.to_f
begin
   if n <=0
         raise 
   end
rescue 
  puts "Inserted Value is wrong".red
  print  "#{src} again:".blue
  n=gets.chomp.to_f
  retry
end
return n
end

print "Enter the product name:".blue
pro=gets.chomp
price=input("Enter the product price")
discount=input("Enter the discount amount in %")

final_price = price - (price * discount / 100)
puts "The #{pro} price is #{price} and after discount final price is #{final_price}".green