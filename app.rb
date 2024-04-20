require_relative 'lib/spelling_bee'

puzzle = SpellingBee::Puzzle.new('W', 'GIKNOR')
game = SpellingBee::Game.new(puzzle)
game.load_solutions('solutions.txt')
game.start