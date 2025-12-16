print "Enter CamelCase string: "
str = gets.chomp

snake = str.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase

puts snake