# Our CLI Controller
require 'open-uri'
require 'pry'
require 'nokogiri'

class Scoreboard::CLI
  def call
    puts "Today's Games"
    list_games
    menu
    #list_scores
    #games
    goodbye
  end

  def list_games
    # here doc http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    games_array = Scoreboard::Scraper.scrape_games
    Scoreboard::Games.today(games_array)
    binding.pry
    Scoreboard::Games.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.matchup}"
    # @games.each.with_index(1) do |game, i|
    #   puts "#{i}. #{game.matchup}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the game you want to see the score or type 'exit'"
      input = gets.chomp

      if input.to_i > 0
        the_game = @games[input.to_i-1]
        puts "#{the_game.score}"
      elsif input == "list"
        list_scores
      else
        puts "Invalid"
      end
    end
  end

  def goodbye
    puts "See you tomorrow degen."
  end

end