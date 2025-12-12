module NumberPrinters
  class EvenPrinter
    def self.numbers(range)
      range.select(&:even?)
    end
  end

  class OddPrinter
    def self.numbers(range)
      range.select(&:odd?)
    end
  end
end

puts "Enter the start of the range:"
start_num = gets.chomp.to_i
puts "Enter the end of the range:"
end_num = gets.chomp.to_i

range = (start_num..end_num)

odd_numbers = NumberPrinters::OddPrinter.numbers(range)
even_numbers = NumberPrinters::EvenPrinter.numbers(range)

puts "Even numbers: #{odd_numbers.join(', ')}"
puts "Odd numbers: #{even_numbers.join(', ')}"


