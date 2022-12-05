print "While loop"
x = gets.chomp.to_i
while x >= 0
    puts x
    x -= 1
end
print "Do while loop"
loop do 
    puts "check answer"
    ans = gets.chomp.to_i
    if ans!=5
        break
    else
        puts ans
    end
end