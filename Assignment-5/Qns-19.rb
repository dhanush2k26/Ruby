module Printer
  class IntCharPrinter
    def self.print(a, b)
      if a.is_a?(Integer) && b.is_a?(String)
        puts "#{a} #{b}"
      elsif a.is_a?(String) && b.is_a?(Integer)
        puts "#{a} #{b}"
      else
        raise ArgumentError, 'Expected integer & character or character & integer'
      end
    end
  end
end

print "Enter the first input (integer or character):"
input1 = gets.chomp
print "Enter the second input (integer or character):"
input2 = gets.chomp
if input1 =~ /^\d+$/ && input2.length == 1
  Printer::IntCharPrinter.print(input1.to_i, input2)
elsif input2 =~ /^\d+$/ && input1.length == 1
  Printer::IntCharPrinter.print(input1, input2.to_i)
else
  puts "Invalid inputs. Please enter one integer and one character."
end
