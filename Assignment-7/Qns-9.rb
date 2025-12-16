print "Enter words separated by space: "
words = gets.chomp.split

regex = /\A(?!.*(note|foot)).*\z/i

filtered = words.select { |w| w =~ regex }

puts "Filtered Words:"
p filtered.join(" ")