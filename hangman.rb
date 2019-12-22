# frozen_string_literal: true

puts 'What is your name ?'
name = gets

puts "Good Luck #{name}"

words = %w[rainbow computer science programming python mathematics player condition reverse water board geeks]

word = words.sample
puts 'Guess the characters'
guesses = ''

turns = 7

while turns.positive?
  failed = 0
  word.each_char do |char|
    if guesses.include?(char)
      print "#{char} "
    else
      print '_ '
      failed += 1
    end
  end

  puts ' '

  if failed.zero?
    puts 'You win'
    puts "The word is : #{word}"
    break
  end

  puts 'Guess a character :'
  guess = gets
  guesses += guess
  i = 0
  while i < word.length
    break if guess[0] == word[i]

    i += 1
  end

  next unless i == word.length

  turns -= 1
  puts "Wrong\n"
  puts "You have #{turns} more guesses\n"
  puts 'You loose' if turns.zero?
end
