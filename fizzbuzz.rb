
$fb = 0
$f = 0
$b = 0
(1..100).each do |number|
	if ((number % 3 == 0) && (number % 5 == 0))
		$fb += 1
		#$f += 1
		#$b += 1
		fizzbuzz =  "-- fizzbuzz"
	elsif (number % 3 == 0)
		$f += 1
		fizzbuzz =  "-- fizz"
	elsif (number % 5 == 0)
		$b += 1
		fizzbuzz =  "-- buzz"
	else 
		fizzbuzz =  ""
	end

	puts "the number is #{number}  #{fizzbuzz}"
end
puts "fizzbuzz happens #{$fb} times; fizz happens #{$f} times; buzz happens #{$b} times."

