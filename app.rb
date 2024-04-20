require_relative 'lib/spelling_bee'

puzzle = SpellingBee::Puzzle.new('A', 'BCDEFG')
game = SpellingBee::Game.new(puzzle)
game.start
