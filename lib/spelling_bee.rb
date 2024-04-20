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
end