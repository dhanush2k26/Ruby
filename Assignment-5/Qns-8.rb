module StringOps
  class ReplacerRegex
    def self.replace_regex(str, regex, replacement)
      regex = regex.gsub(/^\/|\/$/, '')
      str.gsub(Regexp.new(regex), replacement)
    end
  end
end

print "Enter the main string:"
str = gets.chomp
print "Enter the regex pattern to replace:"
regex = gets.chomp
print "Enter the replacement string:"
replacement = gets.chomp
puts StringOps::ReplacerRegex.replace_regex(str.to_s, regex.to_s, replacement.to_s)
