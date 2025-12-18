require 'colorize'
print "Enter directory path: "
dir_path=gets.chomp
print "Enter file extension (e.g., .txt, .rb, .csv): "
file_esn=gets.chomp

list_file=[]
dir_paths =dir_path.gsub('\\', '/')
path = File.join(dir_paths, "*#{file_esn}")
Dir.glob(path) do |f|
  list_file << f
end
list_file.each do |file|
  puts File.basename(file, file_esn).blue
end

puts "Total: #{list_file.size} file(s)"