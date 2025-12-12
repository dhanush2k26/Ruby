module StringOps
  class ToLower
    def self.to_lower(str)
      str.downcase
    end
  end
end

print "Enter the string to convert to lowercase:"
str=gets.chomp
puts StringOps::ToLower.to_lower(str.to_s)
 