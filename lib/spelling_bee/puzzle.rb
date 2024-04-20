require 'rainbow'

module SpellingBee

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

end