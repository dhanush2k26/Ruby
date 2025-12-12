module FileOps
  class PermissionChecker
    def self.readable?(path)
      File.readable?(path)
    end

    def self.writable?(path)
      File.writable?(path)
    end
  end
end
print "Enter the file/directory path to check permissions:"
path=gets.chomp
puts "Is the path readable? #{FileOps::PermissionChecker.readable?(path.to_s)}"
puts "Is the path writable? #{FileOps::PermissionChecker.writable?(path.to_s)}"
