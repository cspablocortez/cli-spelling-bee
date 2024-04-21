module SpellingBee

  class Game 
    def initialize(puzzle)
      @puzzle = puzzle
      @accepted_words = Array.new
      @solution_words = Array.new
      @max_score = 10000
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
      print "Found words: "   # FW and Score could be its own function
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

    def new
      # TODO
    end

    def save
      t = Time.now
      date = t.strftime('%Y_%m_%d')
      file_path = "data/saved/#{date}_progress"

      File.open(file_path, 'w') do |file|
        @accepted_words.each do |word|
          file.puts(word)
        end
      end

      puts "Game progress saved."
    end

    def load
      file_dir = "data/saved"
      Dir.mkdir(file_dir) unless Dir.exist?(file_dir)
      file_name = Dir.entries(file_dir).last
      file_path = File.join(file_dir, file_name)


      if File.exist? (file_path) and file_name.length > 2 # when nothing saved Dir.entries.last returns '..'
        File.foreach(file_path) do |line|
          word = line.chomp
          @accepted_words.push(word)
          @score += self.score_word(word) 
        end
      else
        puts "No saved progress yet."
      end
    end

    def quit
      puts 'Quitting program...'
      self.save
      sleep(1)
      system('clear')
      exit
    end

    def check_word(word)
      if @solution_words.include?(word) and not @accepted_words.include?(word)
        @accepted_words.push(word)
        points = self.score_word(word)
        @score += points
        print Rainbow("(+#{points}) Nice!").green
      elsif @accepted_words.include?(word)
        print Rainbow("Already found!").yellow
      else
        print Rainbow("Not in word list!").red
      end
    end

    def start

      self.load

      while (@score <= @max_score)
        @puzzle.show
        word = self.prompt
        word.upcase!

        case word 
        when ':NEW'
            self.new
          when ':EXIT'
            self.quit
          when ':E'
            self.quit
          when ':QUIT'
            self.quit
          when ':Q'
            self.quit
          when ':SHUFFLE'
            @puzzle.shuffle_outer_words
          when ':SH'
            @puzzle.shuffle_outer_words
          when ';'
            @puzzle.shuffle_outer_words
          when ':SAVE'
            self.save
            puts 'Saving progress...'
            sleep(1)
            puts 'Saved.'
          when ':S'
            self.save
            puts 'Saving progress...'
            sleep(1)
            puts 'Saved.'
          when ':LOAD'
            self.load
            puts 'Loading saved game...'
            sleep(1)
          else
            self.check_word(word)
            sleep(0.5)
        end
      end
    end
    
  end
end
