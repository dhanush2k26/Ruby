module StringOps
  class RemoveDuplicates
    def self.run(str)
      seen = {}
      str.each_char.select { |ch| seen[ch] ? false : (seen[ch] = true) }.join
    end
  end
end
print "Enter the string to remove duplicates:"
str=gets.chomp
puts StringOps::RemoveDuplicates.run(str.to_s)
