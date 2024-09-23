class Hangman
  WORDS = ['ruby', 'programming', 'hangman', 'developer', 'computer',
'apple','orange','grapes','pineapple','lion','tiger','zebra','eagle',
'crow','india','china','usa','asia','dubai','africa','fish','door','glass',
'bottle','mouse','cat','dog','snake','turtle','elephant',

#you can add more words in this format


]

  def initialize
    @word = WORDS.sample
    @guessed_letters = []
    @max_attempts = 6
    @attempts_left = @max_attempts
  end

  def play
    puts "Welcome to Hangman!"
    until game_over?
      display_progress
      player_guess = player_turn
      process_guess(player_guess)
    end
    end_game_message
  end

  private

  def display_progress
    progress = @word.chars.map { |letter| @guessed_letters.include?(letter) ? letter : '_' }.join(' ')
    puts "\nWord: #{progress}"
    puts "Attempts left: #{@attempts_left}"
    puts "Guessed letters: #{@guessed_letters.join(', ')}"
  end

  def player_turn
    guess = nil
    loop do
      print "Enter a letter: "
      guess = gets.chomp.downcase
      break if valid_guess?(guess)

      puts "Invalid input. Please enter a single letter that you haven't guessed yet."
    end
    guess
  end

  def valid_guess?(guess)
    guess.match?(/^[a-z]$/) && !@guessed_letters.include?(guess)
  end

  def process_guess(guess)
    @guessed_letters << guess
    if @word.include?(guess)
      puts "Good guess!"
    else
      puts "Incorrect guess!"
      @attempts_left -= 1
    end
  end

  def game_over?
    all_letters_guessed? || @attempts_left <= 0
  end

  def all_letters_guessed?
    @word.chars.all? { |letter| @guessed_letters.include?(letter) }
  end

  def end_game_message
    if all_letters_guessed?
      puts "Congratulations! You've guessed the word: #{@word}."
    else
      puts "Game over! The word was: #{@word}."
    end
  end
end

def main
  game = Hangman.new
  game.play
end

main