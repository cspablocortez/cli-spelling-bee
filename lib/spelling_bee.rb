module SpellingBee
  APP_NAME = 'NYT Spelling Bee'

  class Puzzle 
    attr_reader :center_letter, :outer_letters, :all_letters

    def initialize(center_letter, outer_letters)
      @center_letter = center_letter
      @outer_letters = outer_letters.split("")
      all_letters = center_letter + outer_letters
      @all_letters = all_letters.split("")
    end

    def show
      puts %(
      #{APP_NAME} 

              #{@outer_letters[0]}
          #{@outer_letters[1]}       #{@outer_letters[2]}
              #{@center_letter}
          #{@outer_letters[5]}       #{@outer_letters[3]}
              #{@outer_letters[4]}
    )
    end
  end

  class Game 
    def initialize(puzzle)
      @puzzle = puzzle
      @words = Array.new
      @solution_words = ['FOO', 'BAR']
      @max_score = 10
      @score = 0
    end

    def prompt
      puts "Score: #{@score}"
      print '> '
      word = gets.chomp!
    end

    def start
      
      while (@score <= @max_score)
        system('clear')
        @puzzle.show
        word = self.prompt

        if @solution_words.include? word.upcase
          @words.push(word)
          @score += 5
          puts "Nice! +5 points"
        else
          puts "Not a word!"
        end

        sleep(1)
      end

    end
  end
end