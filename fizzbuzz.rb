
(1..100).each do |number|
	if ((number % 3 == 0) && (number % 5 == 0))
		puts "the number is #{number} -- fizzbuzz"
	elsif (number % 3 == 0)
		puts "the number is #{number} -- fizz"
	elsif (number % 5 == 0)
		puts "the number is #{number} -- buzz"
	else 
		puts "the number is #{number} "
	end
end

