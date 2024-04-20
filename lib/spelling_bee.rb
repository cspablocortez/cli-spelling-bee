require 'rainbow'
require 'io/console'
require_relative 'spelling_bee/puzzle'
require_relative 'spelling_bee/game'

module SpellingBee

  APP_NAME = 'CLI Spelling Bee'
  TERMINAL_WIDTH = IO.console.winsize[1] rescue 80
  
end
