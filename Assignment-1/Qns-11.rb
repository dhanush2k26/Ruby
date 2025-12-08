=begin
11.	Write a program in Ruby to display the pattern like a diamond.
      *                                                                          
     ***                                                                         
    *****                                                                        
   *******                                                                       
  *********                                                                      
 ***********                                                                     
*************                                                                    
 ***********                                                                     
  *********                                                                      
   *******                                                                       
    *****                                                                        
     ***                                                                         
      *     
 

=end
print "Enter the Value:"
n=gets.chomp.to_i
for i in 1..n do
    (n - i).times do
        print " "
    end
    (2 * i - 1).times do
        print "*"
    end
    puts ""
end

for i in (n-1).downto(1) do
    (n - i).times do
        print " "
    end
    (2 * i - 1).times do
        print "*"
    end
    puts ""
end