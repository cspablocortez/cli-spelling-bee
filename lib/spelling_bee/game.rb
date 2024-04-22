module SpellingBee

  class Game 
    def initialize(puzzle)
      @puzzle = puzzle
      @found_words = Array.new
      @solution_words = Array.new
      @max_score = 10000
      @score = 0
    end

    def to_json(*options)
      {
        'saved_at' => Time.now,
        'puzzle' => @puzzle,
        'score' => @score,
        'found_words' => @found_words
      }
      .to_json(*options)
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
      p @found_words
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
      date = t.strftime('%Y-%m-%d')
      file_path = "data/saved/archive/#{date}.json"

      File.open(file_path, 'w') do |file|
        file.puts(self.to_json)
      end

      puts "Game progress saved to archive."

    end

    def show_archived_games(files)
      files.each_with_index do |file, index|
        puts "[#{index}] #{file}"
      end
    end

    def select_load_file
      directory_path = 'data/saved/archive'
      player_save_files = Dir.entries(directory_path).select { |file| File.file?(File.join(directory_path, file)) }
      
      if player_save_files.empty?
        puts "No saved games yet!"
      else
        puts "Select a file: "
        self.show_archived_games(player_save_files)
        print ">> "
        user_selection = gets.chomp!
        selected_file = player_save_files[user_selection.to_i]
        
        json_string = File.read(File.join(directory_path, selected_file))
        game_data = JSON.parse(json_string)
        self.load_game(game_data)
      end

    end

    def load_game(data)           
      @found_words = data['found_words']
      @score = data['score']
    end

    def load_latest
      file_dir = "data/saved/archive"
      file_name = Dir.entries(file_dir).last
      file_path = File.join(file_dir, file_name)


      if File.exist? (file_path)
        json_string = File.read(file_path)
        game_data = JSON.parse(json_string)
        self.load_game(game_data)
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
      if @solution_words.include?(word) and not @found_words.include?(word)
        @found_words.push(word)
        points = self.score_word(word)
        @score += points
        print Rainbow("(+#{points}) Nice!").green
      elsif @found_words.include?(word)
        print Rainbow("Already found!").yellow
      else
        print Rainbow("Not in word list!").red
      end
    end

    def start

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
            self.select_load_file
            puts 'Development feature...'
            sleep(1)
          else
            self.check_word(word)
            sleep(0.5)
        end
      end
    end
    
  end
end
