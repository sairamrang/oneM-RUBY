

def copyText(fName, fText)
	file = open(fName, "w")
	file.write (fText)
	file.close
end

print "What's the file name? "
name = gets.chomp
oldText = open(name).read

print "What's the file name you want to create ? "
name = gets.chomp

copyText(name,oldText)


