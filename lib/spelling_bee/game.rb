module SpellingBee

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
      print "Found words: "
      p @accepted_words
      puts "Score: #{@score}"
      puts 
      print '> '
      word = gets.chomp!
    end

    def score_word(word)
      case 
        when word.length == 4
          points = 4
        when word.length > 4
          points = 4 + (word.length % 4)
        else
          points = 0
      end
      points

    end

    def start
      while (@score <= @max_score)
        system('clear')
        @puzzle.show
        word = self.prompt
        word.upcase!

        case word 
          when ':EXIT'
            puts 'Ending program...'
            exit
          when ':SHUFFLE'
            @puzzle.shuffle_outer_words
          else
            if @solution_words.include?(word) and not @accepted_words.include?(word)
              @accepted_words.push(word)
              points = self.score_word(word)
              puts "points: #{points}"
              @score += points
              print Rainbow("\tNice! +#{points} points").green
            elsif @accepted_words.include?(word)
              print Rainbow("\tAlready found!").yellow
            else
              print Rainbow("\tNot in word list!").red
            end  
        end

        sleep(0.5)
      end
    end
    
  end
end