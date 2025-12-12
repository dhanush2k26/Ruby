require 'colorize'
print "Enter the String of Words:".yellow
n=gets.chomp.split
print "Enter the how many value want to keep:".green
last_length=gets.chomp.to_i
final_value=n.take(last_length).join(" ")
puts final_value.blue