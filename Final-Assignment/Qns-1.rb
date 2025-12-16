
class LogAnalyzer
  LogError = Struct.new(:line_number, :content)

  attr_reader :errors

  def initialize(file_path)
    @file_path = file_path
    @errors = []
  end

  def process
    File.foreach(@file_path).with_index(1) do |line, idx|
      if line =~ /error/i
        @errors << LogError.new(idx, line.strip)
      end
    end
  end
end
print "Enter log file path (or press Enter for default 'sample.log'):"
pathv = gets.chomp
begin
  File.open(pathv, 'r+')
rescue Errno::ENOENT
  puts "Invalid File path"
  print "Enter the Correct path:"
  pathv = gets.chomp
  retry
end

analyzer = LogAnalyzer.new(pathv)
analyzer.process
puts "Found #{analyzer.errors.size} error(s)"
analyzer.errors.each do |err|
  puts "Line: #{err.line_number} #{err.content}"
end
