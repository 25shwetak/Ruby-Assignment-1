print "Enter mobile number"
n=gets

if n.match(/\A[1-9][0-9]{9}\Z/)
	print "A Mobile number"
else 
	print "Not a mobile number"
end

puts " "
puts " "

print "Enter email address"
n=gets

if n.match(/\A[a-zA-Z0-9]+[.|_]*[a-zA-Z0-9]+[@][a-zA-Z]+[.][a-z]{3}\Z/)
	print "A valid email address"
else 
	print "Not a valid email address"
end

puts " "
puts " "

print "Enter a Name"
n=gets

if n.match(/\A[a-zA-Z]+\s[a-zA-Z]+\Z/)
	print "A valid Name"
else 
	print "Not a valid Name"
end

puts " "
puts " "

print "Enter gender"
n=gets

if n.match(/[M]|[m]|[F]|[f]/)
	print "Valid"
elsif match(/\A[F]+\Z/)
	print "Invalid"
end

print "Enter a Amount"
n=gets

if n.match(/\A[0-9]*[.]?[0-9]+\Z/)
	print "A valid Amount"
else 
	print "Not a valid Amount"
end

puts " "
puts " "

print "Enter IFSC Code"
n=gets

if n.match(/\A[A-Z]+{4}[0][0-9]+{6}\Z/)
	print "A valid IFSC Code"
else 
	print "Not a valid IFSC Code"
end

puts " "
puts " "


print "Enter Pan Card Number"
n=gets

if n.match(/\A[A-Z]+{5}[0-9]+{4}[A-Z]\Z/)
	print "A valid Pan Card Number"
else 
	print "Not a valid Pan Card number"
end

puts " "
puts " "


print "Enter GST Number"
n=gets

if n.match(/\A[0-9]+{2}[A-Z]+{5}[0-9]+{4}[A-Z][0-9][Z][0-9]\Z/)
	print "A valid GST Number"
else 
	print "Not a valid GST Number"
end

puts " "
puts " "

