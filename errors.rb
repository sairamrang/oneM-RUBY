# This method breaks up text into words for us.
def break_words(text)
	words = text.split(' ')
	return words
end

# Sorts the words (alphabetically).
def sort_words(words)
	return words.sort
end

# Counts the number of words
def count_words(words)
	return words.size
end

 # Prints the first word after popping it off.
 def print_first_word(words)
 	word = words.shift
 	puts word
 end

# Prints the last word after popping it off.
def print_last_word(words)
 	word = words.pop
 	puts word
end

# Takes in a full sentence and returns the sorted words.
def sort_sentence(sentence)
 	words = break_words(sentence)
 	return sort_words(words)
end

# Prints the first and last words of the sentence.
def print_first_and_last(sentence)
 words = break_words(sentence)
 print_first_word(words)
 print_last_word(words)
end



demetri_martin_joke = "I used to play sports. 
Then I realized you can buy trophies. Now I am good at everything."

puts "--------------"
puts demetri_martin_joke
puts "--------------"



bottles = 100 + 10 - 15 + 4
puts "This should be ninety-nine: #{bottles}"

def sing(bottles_of_beer)
 puts "#{bottles_of_beer} bottles of beer on the wall, \
#{bottles_of_beer} bottles of beer."
 
 print "Take one down and pass it around, "
 bottles_of_beer -= 1
 
 puts "#{bottles_of_beer} bottles of beer on the wall"

 return bottles_of_beer
end

sing(sing(sing(bottles)))



sentence = "I think it's interesting that 'cologne' rhymes with 'alone'."
words = break_words(sentence)
puts "#{sentence} has #{count_words(words)} words"
sorted_words = sort_words(words)
print_first_word(words)
print_last_word(words)
print_first_word(sorted_words)
print_last_word(sorted_words)
sorted_words = sort_sentence(sentence)
print_first_and_last(sentence)