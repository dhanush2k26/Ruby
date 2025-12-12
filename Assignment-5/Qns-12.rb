module StringOps
  class ReplacerString
    def self.replace(str, pattern, replacement)
      str.gsub(pattern, replacement)
    end
  end
end
print "Enter the main string:"
str=gets.chomp
print "Enter the pattern to replace:"
pattern=gets.chomp
print "Enter the replacement string:"
replacement=gets.chomp
puts StringOps::ReplacerString.replace(str.to_s, pattern.to_s, replacement.to_s)