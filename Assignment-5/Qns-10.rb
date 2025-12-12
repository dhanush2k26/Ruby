module StringOps
  class FirstNonRepeating
    def self.find(str)
      counts = Hash.new(0)
      str.each_char { |ch| counts[ch.downcase] += 1 }
      str.each_char.find { |ch| counts[ch.downcase] == 1 }
    end
  end
end
print "Enter the string for finding first non-repeating character:"
str=gets.chomp
puts StringOps::FirstNonRepeating.find(str.to_s)