require 'open-uri'
require 'pry'
require 'nokogiri'

class Scoreboard::Games

  attr_accessor :games, :num_games, :matchup, :score, :status, :matchup_array, :away_team, :away_score, :home_team, :home_score

  def initialize(games_hash)
    binding.pry
    games_hash.each {|k, v| self.send("#{k}=", v)}
  end


  def self.today(games_array)
    games_array.each {|games_hash| Games.new(games_hash)}

  end



end