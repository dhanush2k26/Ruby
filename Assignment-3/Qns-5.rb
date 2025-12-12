require "colorize"

def input(count)
    print "Enter the #{count} binary  value :".blue
    n = gets.chomp
    begin
        if n.empty? || n.match(/[^01]/)
            raise
        end
    rescue
        puts "Inserted Value is wrong".red
        print "Enter the #{count} binary  value again:".blue
        n = gets.chomp
        retry
    end
    n.to_i(2)
end

v1 = input("1st")
v2 = input("2nd")
puts "The sum of binary #{v1.to_s(2)} and #{v2.to_s(2)} is #{(v1 + v2).to_s(2)}"