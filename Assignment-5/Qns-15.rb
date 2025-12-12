require 'colorize'
module FileOps
  class Appender
    def self.append(file, text)
      File.open(file, 'a') { |f| f.write("\t"+text) }
    end
    def self.read(file)
      File.read(file)
    end
  end
end
print "Enter the file name to append to:"
file=gets.chomp
print "Before appending, the current content of the file is:"
puts FileOps::Appender.read(file.to_s)
print "Enter the text to append to the file:"
text=gets.chomp
FileOps::Appender.append(file.to_s, text.to_s)
puts "After appending, the updated content of the file is:"
puts FileOps::Appender.read(file.to_s)

