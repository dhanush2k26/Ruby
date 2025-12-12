module AlphabetIndex
  class Indexer
    def self.index_all_chars(text)
      hash = {}
      text.downcase.chars.each_with_index do |ch, idx|
        next unless ('a'..'z').include?(ch)
        hash[ch] ||= []
        hash[ch] << idx
      end
      hash
    end
  end
end
print "Enter the String of characters:"
text=gets.chomp
hash = AlphabetIndex::Indexer.index_all_chars(text.to_s)
hash.each do |key, value|
  puts "#{key}: #{value}"
end


