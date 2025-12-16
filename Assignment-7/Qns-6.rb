print "Enter text with comments: "
text = gets.chomp

result = text.gsub(/<!--.*?-->/m, "[REDACTED]")

puts result