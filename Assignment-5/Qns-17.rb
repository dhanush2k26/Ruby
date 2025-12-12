module FileOps
  class LongestWordFinder
    def self.longest_word(file)
      longest = ''
      File.foreach(file) do |line|
        line.scan(/[a-zA-Z]+/) do |word|
          longest = word if word.length > longest.length
        end
      end
      longest
    end
  end
end
print "Enter the file name to find the longest word:"
file=gets.chomp
puts "The longest word in the file is:"
puts FileOps::LongestWordFinder.longest_word(file.to_s)

