# frozen_string_literal: true

puts 'Enter grade'
x = gets.to_i
if x.between?(1, 5)
  puts 'elementary'
elsif x.between?(6, 8)
  puts 'middle school'
elsif x.between?(9, 12)
  puts 'high school'
else
  puts 'college'
end
