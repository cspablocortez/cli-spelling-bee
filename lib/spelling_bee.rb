require 'rainbow'

module SpellingBee
  APP_NAME = 'CLI Spelling Bee'

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
      #{Rainbow(APP_NAME).yellow} 

              #{@outer_letters[0]}
          #{@outer_letters[1]}       #{@outer_letters[2]}
              #{Rainbow(@center_letter).yellow}
          #{@outer_letters[5]}       #{@outer_letters[3]}
              #{@outer_letters[4]}
    )
    end
  end

  class Game 
    def initialize(puzzle)
      @puzzle = puzzle
      @accepted_words = Array.new
      @solution_words = Array.new
      @max_score = 100
      @score = 0
    end

    def load_solutions(file_path)
      if File.exist? (file_path)
        @solution_words = File.readlines(file_path).map(&:chomp)
      else
        puts "File does not exist."
      end
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
        print "Found words: "
        p @accepted_words
        word = self.prompt
        word.upcase!

        if @solution_words.include?(word) and not @accepted_words.include?(word)
          @accepted_words.push(word)
          @score += 5
          puts Rainbow("\tNice! +5 points").green
        elsif @accepted_words.include?(word)
          puts Rainbow("\tAlready found!").gray
        else
          puts Rainbow("\tNot in word list!").red
        end
      

        sleep(0.5)
      end

    end
  end
end