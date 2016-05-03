require 'open-uri'
require 'pry'
require 'nokogiri'

class Scoreboard::Games

  attr_accessor :games, :games_array, :num_games, :matchup, :score, :status, :matchup_array, :away_team, :away_score, :home_team, :home_score, :games_hash

  @@all = []

  def initialize(games_hash)
    games_hash.each {|k, v| self.send("#{k}=", v)}
    self.class.all << self
  end


  def self.today(games_array)
    games_array.each {|games_hash| Scoreboard::Games.new(games_hash)}
  end

  def self.all
    @@all
  end

end