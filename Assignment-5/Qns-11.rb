module TextOps
  class EndWithCounter
    def self.count_end_m_n(text)
      text.split.count do |word|
        w = word.gsub(/[^a-z]/i, '')
        !w.empty? && %w[m n].include?(w[-1].downcase)
      end
    end
  end
end
print "Enter the text:"
text=gets.chomp
puts TextOps::EndWithCounter.count_end_m_n(text.to_s)