module FileOps
  class Reader
    def self.read_first_n_lines(file, n = 3)
      lines = []
      File.open(file, 'r') do |f|
        n.times { lines << f.gets }
      end
      lines.compact
    end
  end
end
print "Enter the file name to read from:"
file=gets.chomp
puts "First 3 lines of the file are:"
puts FileOps::Reader.read_first_n_lines(file.to_s).join("\n")