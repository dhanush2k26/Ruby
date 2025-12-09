print "Enter the number:"
n=gets.chomp.to_i
diff=(n-33).abs
if n>33 then
  puts diff*2
else
 	 puts diff
end