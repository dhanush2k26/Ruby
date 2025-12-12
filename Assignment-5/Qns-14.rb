module FileOps
  class PlainFile
    def self.write(file, content)
      File.open(file, 'w') { |f| f.write(content) }
    end

    def self.read(file)
      File.read(file)
    end
  end
end
print "Enter the file name to write to:"
file=gets.chomp
print "Enter the content to write into the file:"
content=gets.chomp
puts FileOps::PlainFile.write(file.to_s, content.to_s)
puts "Content written to the file successfully."
puts "Reading content from the file:"
puts FileOps::PlainFile.read(file.to_s)

