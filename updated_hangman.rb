def hangman

  puts "What is your name ?"
  name = gets

  puts "Good Luck #{name}"

  words = ['rainbow', 'computer', 'science', 'programming', 'python', 'mathematics', 'player', 'condition', 'reverse', 'water', 'board', 'geeks']

  word = words.sample
  puts "Guess the characters"
  guesses = ''

  turns = 7

  while turns > 0
    failed = 0
    word.each_char do |char|
      if guesses.include?(char)
        print "#{char} "
      else
        print "_ "
        failed +=1
      end
    end
    puts " "

    if failed == 0
      puts "You win"
      puts "The word is : #{word}"
      break
    end

    puts "Guess a character :"
    guess = gets
    guesses += guess
    i=0
    while i<word.length
      if guess[0]==word[i]
        break
      end
      i+=1
    end

    if i==word.length
      turns -= 1
      puts "Wrong\n"
      puts "You have #{turns} more guesses\n"
      if turns == 0
        puts "You loose"
      end
    end
  end
end

flag = true

while flag
  hangman
  p "Do you want to play more ? (y/n)"
  ans = gets.chomp
  if ans == "n"
    flag = false
    break
  end
end
