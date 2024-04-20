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

    def pangram?(word)
      @puzzle.all_letters.all? { |letter| word.include?(letter.upcase) }
    end

    def score_word(word)
      if self.pangram?(word)
        points = 4 + (word.length % 4) + 7  
      elsif word.length > 4
        points = word.length
      elsif word.length == 4
        points = 1
      else
        points = 0
      end
      points
    end

    def save
      t = Time.now
      date = t.strftime('%Y_%m_%d')
      file_path = "data/saved/#{date}"

      File.open(file_path, 'w') do |file|
        @accepted_words.each do |word|
          file.puts(word)
        end
      end

      sleep(0.5)
      puts "Done!"
    end

    def load
      # Create path

      # Save to data dir

      # Output 
    end

    def check_word(word)
      puts "Checking #{word}"
      if @solution_words.include?(word) and not @accepted_words.include?(word)
        @accepted_words.push(word)
        points = self.score_word(word)
        @score += points
        print Rainbow("\tNice! +#{points} points").green
      elsif @accepted_words.include?(word)
        print Rainbow("\tAlready found!").yellow
      else
        print Rainbow("\tNot in word list!").red
      end  
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
          when ':SAVE'
            puts 'Saving progress...'
            self.save
          when ':LOAD'
            puts 'Loading saved game...'
            self.load
          else
            self.check_word(word)
        end

        sleep(0.5)
      end
    end
    
  end
end