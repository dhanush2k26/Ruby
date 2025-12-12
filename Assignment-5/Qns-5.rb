module StringOps
  class Concatenator
    def self.concat(s1, s2)
      s1 + s2
    end
  end
end

print "Enter first string: "
str1 = gets.chomp
print "Enter second string: "
str2 = gets.chomp
result = StringOps::Concatenator.concat(str1, str2)
puts "Concatenated string: #{result}"
