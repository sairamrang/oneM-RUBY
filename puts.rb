#
name = "Sairam Rangachari"
name = name.downcase
print "Enter your name : "
name= gets.chomp
print "Enter your age : "
age= gets.chomp
puts "Entered name is #{name.reverse} and your age is #{age} and your age in dogyears is #{age.to_i/7}"
print "Enter your biil : "
bill = gets.chomp
puts "your tip is #{bill.to_f * 0.15}"
# this is just a comment

def print_two(thing1, thing2)
	puts "Thing1 is #{thing1}"
	puts "Thing2 is #{thing2}"
end

def add(number1, number2)
	puts "Adding #{number1} and #{number2}"
	return number1+number2
end

def TextCapAndReverse (text)
	returnText = text.reverse
	returnText = returnText.upcase
	return returnText
end

added = add(23,34)
puts "Added sum is #{added}"

print_two("Rehan", "Samir")


originalText = "anonymous"
changedText = TextCapAndReverse (originalText)
puts "originalText was #{originalText} and manipulated text is #{changedText}"
