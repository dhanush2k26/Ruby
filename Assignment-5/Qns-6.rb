module StringOps
  class SequenceChecker
    def self.contains_sequence?(string, sequence)
      string.include?(sequence)
    end
  end
end
puts "Enter the main string:"
s=gets.chomp
puts "Enter the sequence to check:"
seq=gets.chomp
if StringOps::SequenceChecker.contains_sequence?(s, seq)
  puts "The sequence '#{seq}' is present in the string."
else
  puts "The sequence '#{seq}' is not present in the string."
end
