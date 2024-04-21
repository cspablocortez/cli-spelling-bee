require_relative 'lib/spelling_bee'

puzzle = SpellingBee::Puzzle.new('N', 'TUIAPL')
game = SpellingBee::Game.new(puzzle)
game.load_solutions('data/solutions/2024_04_20_solution.txt')
game.start
